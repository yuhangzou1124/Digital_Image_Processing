import os
import argparse
import torch
import torchvision
from torchvision import datasets, transforms
from torch import nn
from torch.utils.data import DataLoader
from torch.utils.data import random_split

def build_model(num_classes, use_pretrained=True, dropout=0.3):
    try:
        weights = torchvision.models.EfficientNet_B0_Weights.IMAGENET1K_V1 if use_pretrained else None
        m = torchvision.models.efficientnet_b0(weights=weights)
    except Exception:
        m = torchvision.models.efficientnet_b0(pretrained=use_pretrained)
    n = m.classifier[1].in_features
    m.classifier = nn.Sequential(
        nn.Linear(n, 2048),
        nn.SiLU(),
        nn.Dropout(dropout),
        nn.Linear(2048, 2048),
        nn.SiLU(),
        nn.Dropout(dropout),
        nn.Linear(2048, num_classes)
    )
    return m

class TransformedSubset(torch.utils.data.Dataset):
    def __init__(self, subset, transform=None):
        self.subset = subset
        self.transform = transform
        
    def __getitem__(self, index):
        x, y = self.subset[index]
        if self.transform:
            x = self.transform(x)
        return x, y
        
    def __len__(self):
        return len(self.subset)

def make_loaders(root, batch_size, val_ratio=0.1, num_workers=4, image_size=224):
    # Training transforms with augmentation
    train_tfm = transforms.Compose([
        transforms.Resize((image_size, image_size)),
        transforms.RandomHorizontalFlip(),
        transforms.RandomRotation(15),
        transforms.ColorJitter(brightness=0.1, contrast=0.1, saturation=0.1),
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
    ])
    
    # Validation transforms (no augmentation)
    val_tfm = transforms.Compose([
        transforms.Resize((image_size, image_size)),
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
    ])

    train_dir = os.path.join(root, 'train')
    val_dir = os.path.join(root, 'val')

    train_ds = None
    val_ds = None
    classes = []

    # Scenario 1: 'train' and 'val' subdirectories exist
    if os.path.isdir(train_dir):
        print(f"Loading training data from: {train_dir}")
        # Load directly with train_tfm
        full_ds = datasets.ImageFolder(train_dir, transform=train_tfm)
        classes = full_ds.classes 
        
        if os.path.isdir(val_dir):
            print(f"Loading validation data from: {val_dir}")
            train_ds = full_ds
            val_ds = datasets.ImageFolder(val_dir, transform=val_tfm)
        else:
            # Fallback: Split 'train' dir if 'val' dir missing (unlikely if structure is correct but possible)
            print(f"No validation directory found, splitting training data with ratio {val_ratio}")
            # Load raw without transform for splitting
            raw_ds = datasets.ImageFolder(train_dir) # No transform yet
            n = len(raw_ds)
            nv = max(1, int(n * val_ratio))
            nt = n - nv
            t_sub, v_sub = random_split(raw_ds, [nt, nv])
            train_ds = TransformedSubset(t_sub, train_tfm)
            val_ds = TransformedSubset(v_sub, val_tfm)
            
    # Scenario 2: Flat directory structure (or just 'dog_dataset' root)
    else:
        print(f"'{train_dir}' not found. Attempting to load from root: {root}")
        raw_ds = datasets.ImageFolder(root) # No transform yet
        classes = raw_ds.classes
        
        print(f"Loaded {len(raw_ds)} images from {root}. Splitting with ratio {val_ratio}")
        n = len(raw_ds)
        nv = max(1, int(n * val_ratio))
        nt = n - nv
        t_sub, v_sub = random_split(raw_ds, [nt, nv])
        train_ds = TransformedSubset(t_sub, train_tfm)
        val_ds = TransformedSubset(v_sub, val_tfm)

    dl_tr = DataLoader(train_ds, batch_size=batch_size, shuffle=True, num_workers=num_workers, pin_memory=True)
    dl_va = DataLoader(val_ds, batch_size=batch_size, shuffle=False, num_workers=num_workers, pin_memory=True)
    
    return dl_tr, dl_va, classes

def evaluate(model, dl, device):
    model.eval()
    correct = 0
    total = 0
    with torch.no_grad():
        for x, y in dl:
            x = x.to(device)
            y = y.to(device)
            logits = model(x)
            pred = torch.argmax(logits, dim=1)
            correct += (pred == y).sum().item()
            total += y.size(0)
    return correct / max(1, total)

def train_one(root, out_path, epochs=40, batch_size=32, device='auto', lr=1e-4, val_ratio=0.1, amp=True, save_classes=True, num_workers=4, image_size=224, dropout=0.3):
    if device == 'auto':
        device = 'cuda' if torch.cuda.is_available() else 'cpu'
    
    dl_tr, dl_va, classes = make_loaders(root, batch_size, val_ratio, num_workers, image_size)
    
    print(f"Detected {len(classes)} classes: {classes[:5]}...")
    
    model = build_model(len(classes), dropout=dropout).to(device)
    opt = torch.optim.AdamW(model.parameters(), lr=lr)
    scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(opt, mode='max', factor=0.5, patience=3, verbose=True)
    crit = nn.CrossEntropyLoss()
    best_acc = 0.0
    
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    scaler = torch.cuda.amp.GradScaler(enabled=amp and device == 'cuda')
    
    for epoch in range(epochs):
        model.train()
        for x, y in dl_tr:
            x = x.to(device)
            y = y.to(device)
            opt.zero_grad()
            if scaler.is_enabled():
                with torch.cuda.amp.autocast():
                    loss = crit(model(x), y)
                scaler.scale(loss).backward()
                scaler.step(opt)
                scaler.update()
            else:
                loss = crit(model(x), y)
                loss.backward()
                opt.step()
        
        acc = evaluate(model, dl_va, device)
        scheduler.step(acc)
        print(f"Epoch [{epoch+1}/{epochs}] Accuracy: {acc:.4f} LR: {opt.param_groups[0]['lr']:.2e}", flush=True)
        
        if acc >= best_acc:
            best_acc = acc
            torch.save({'model_state_dict': model.state_dict()}, out_path)
            if save_classes:
                with open(os.path.splitext(out_path)[0] + '.classes.txt', 'w', encoding='utf-8') as f:
                    for c in classes:
                        f.write(str(c) + '\n')
    return classes

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--root', required=True)
    parser.add_argument('--out', required=True)
    parser.add_argument('--epochs', type=int, default=40)
    parser.add_argument('--batch_size', type=int, default=32)
    parser.add_argument('--device', type=str, default='auto')
    parser.add_argument('--lr', type=float, default=1e-4)
    parser.add_argument('--val_ratio', type=float, default=0.1)
    parser.add_argument('--amp', type=int, default=1)
    parser.add_argument('--save_classes', type=int, default=1)
    parser.add_argument('--num_workers', type=int, default=4, help="Number of data loading workers")
    parser.add_argument('--image_size', type=int, default=224, help="Input image size")
    parser.add_argument('--dropout', type=float, default=0.3, help="Dropout rate")
    
    args = parser.parse_args()
    train_one(args.root, args.out, args.epochs, args.batch_size, args.device, args.lr, args.val_ratio, 
              bool(args.amp), bool(args.save_classes), args.num_workers, args.image_size, args.dropout)

if __name__ == '__main__':
    main()
