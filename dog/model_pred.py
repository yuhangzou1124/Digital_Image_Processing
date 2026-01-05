import os
import torch
import torchvision
from torchvision import transforms
from PIL import Image
from torch import nn

DATASET_PATH = r'c:\Users\34566\matlab-code\image_processing\dog\dog_dataset\train'
IMAGE_SIZE = 300  # 如果你在训练时修改了 image_size，请务必同步修改这里！

def build_model(num_classes, use_pretrained=True):
    try:
        weights = torchvision.models.EfficientNet_B0_Weights.IMAGENET1K_V1 if use_pretrained else None
        m = torchvision.models.efficientnet_b0(weights=weights)
    except Exception:
        m = torchvision.models.efficientnet_b0(pretrained=use_pretrained)
    n = m.classifier[1].in_features
    m.classifier = nn.Sequential(
        nn.Linear(n, 2048),
        nn.SiLU(),
        nn.Dropout(0.3),
        nn.Linear(2048, 2048),
        nn.SiLU(),
        nn.Dropout(0.3),
        nn.Linear(2048, num_classes)
    )
    return m

def get_classes(dataset_dir):
    return sorted([d for d in os.listdir(dataset_dir) if os.path.isdir(os.path.join(dataset_dir, d))])

def get_classes_from_file(classes_file):
    with open(classes_file, 'r', encoding='utf-8') as f:
        return [line.strip() for line in f if line.strip()]

def preprocess_image(image_path, image_size=IMAGE_SIZE):
    tfm = transforms.Compose([
        transforms.Resize((image_size, image_size)),
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
    ])
    img = Image.open(image_path).convert('RGB')
    return tfm(img).unsqueeze(0)

def predict_with_checkpoint(checkpoint_path, image_path, dataset_root=None, device=None):
    if device is None:
        device = 'cuda' if torch.cuda.is_available() else 'cpu'
    
    # 1. 优先尝试从同名的 .classes.txt 加载类别
    classes_file = os.path.splitext(checkpoint_path)[0] + '.classes.txt'
    if os.path.exists(classes_file):
        classes = get_classes_from_file(classes_file)
    else:
        # 2. 降级方案：从数据集目录扫描
        if dataset_root is None:
            dataset_root = DATASET_PATH
        classes = get_classes(dataset_root)

    model = build_model(len(classes))
    ckpt = torch.load(checkpoint_path, map_location=device)
    state = ckpt['model_state_dict'] if isinstance(ckpt, dict) and 'model_state_dict' in ckpt else ckpt
    model.load_state_dict(state)
    model.to(device)
    model.eval()
    
    # 使用全局定义的 IMAGE_SIZE 进行预处理
    x = preprocess_image(image_path, IMAGE_SIZE).to(device)
    
    with torch.no_grad():
        logits = model(x)
        idx = int(torch.argmax(logits, dim=1).item())
    return classes[idx]
