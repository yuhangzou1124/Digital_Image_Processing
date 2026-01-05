function output_img = adaptiveHistogramEqualization(input_img, num_tiles, clip_limit)
    % 自定义限制对比度自适应直方图均衡化 (CLAHE)
    % 输入: 
    %   input_img - 输入图像 (灰度，uint8 或 double)
    %   num_tiles - [rows, cols] 瓦片数量，例如 [8, 8]。可选，默认 [8, 8]
    %   clip_limit - 对比度限制阈值。可选，默认 0.01
    
    if nargin < 2 || isempty(num_tiles)
        num_tiles = [8, 8];
    end
    if nargin < 3 || isempty(clip_limit)
        clip_limit = 0.01;
    end
    
    is_double = isa(input_img, 'double');
    if is_double
        img_u8 = uint8(input_img * 255);
    else
        img_u8 = input_img;
    end
    
    [H, W] = size(img_u8);
    tileH = floor(H / num_tiles(1));
    tileW = floor(W / num_tiles(2));
    
    mappings = zeros(num_tiles(1), num_tiles(2), 256);
    pixels_per_tile = tileH * tileW;
    
    real_clip_limit = max(1, round(clip_limit * pixels_per_tile)); 
    
    avg_bin_count = pixels_per_tile / 256;
    if real_clip_limit < avg_bin_count * 1.5
        real_clip_limit = avg_bin_count * 3; 
    end

    for r = 1:num_tiles(1)
        for c = 1:num_tiles(2)
            r_start = (r-1)*tileH + 1;
            r_end = min(r*tileH, H);
            c_start = (c-1)*tileW + 1;
            c_end = min(c*tileW, W);
            
            tile = img_u8(r_start:r_end, c_start:c_end);
            
            counts = computeHistogram(tile);
            
            excess = 0;
            for k = 1:256
                if counts(k) > real_clip_limit
                    excess = excess + (counts(k) - real_clip_limit);
                    counts(k) = real_clip_limit;
                end
            end
            
            increment = floor(excess / 256);
            counts = counts + increment;
            remaining = excess - increment * 256;
            counts(1:remaining) = counts(1:remaining) + 1;
            
            cdf = zeros(1, 256);
            sum_val = 0;
            actual_pixels = sum(counts); 
            for k = 1:256
                sum_val = sum_val + counts(k);
                cdf(k) = sum_val;
            end
            
            mappings(r, c, :) = round((cdf / actual_pixels) * 255);
        end
    end
    
    output_u8 = zeros(H, W, 'uint8');
    
    for i = 1:H
        for j = 1:W
            y = (i - tileH/2) / tileH + 1;
            x = (j - tileW/2) / tileW + 1;
            
            r_low = floor(y);
            c_low = floor(x);
            r_high = r_low + 1;
            c_high = c_low + 1;
            
            dy = y - r_low;
            dx = x - c_low;
            
            r_low_idx = max(1, min(r_low, num_tiles(1)));
            r_high_idx = max(1, min(r_high, num_tiles(1)));
            c_low_idx = max(1, min(c_low, num_tiles(2)));
            c_high_idx = max(1, min(c_high, num_tiles(2)));
            
            val = img_u8(i, j);
            val_idx = val + 1;
            
            map11 = mappings(r_low_idx, c_low_idx, val_idx);
            map12 = mappings(r_low_idx, c_high_idx, val_idx);
            map21 = mappings(r_high_idx, c_low_idx, val_idx);
            map22 = mappings(r_high_idx, c_high_idx, val_idx);
            
            res = (1-dy)*(1-dx)*double(map11) + ...
                  (1-dy)*dx*double(map12) + ...
                  dy*(1-dx)*double(map21) + ...
                  dy*dx*double(map22);
                  
            output_u8(i, j) = uint8(res);
        end
    end
    
    if is_double
        output_img = double(output_u8) / 255;
    else
        output_img = output_u8;
    end
end
