function output_img = histogramEqualization(input_img)
    % 自定义直方图均衡化函数
    % 输入: input_img - 输入图像 (灰度图或双精度归一化图像)
    % 输出: output_img - 均衡化后的图像

    is_double = isa(input_img, 'double');
    
    if ~is_double
        img_u8 = input_img;
    else
        img_u8 = uint8(input_img * 255);
    end
    
    [rows, cols] = size(img_u8);
    num_pixels = rows * cols;
    
    counts = computeHistogram(img_u8);
    
    cdf = zeros(1, 256);
    current_sum = 0;
    for i = 1:256
        current_sum = current_sum + counts(i);
        cdf(i) = current_sum;
    end
    
    map = zeros(1, 256);
    for i = 1:256
        map(i) = round((cdf(i) / num_pixels) * 255);
    end
    
    output_u8 = zeros(rows, cols, 'uint8');
    for i = 1:rows
        for j = 1:cols
            val = img_u8(i, j);
            output_u8(i, j) = map(val + 1);
        end
    end
    
    if is_double
        output_img = double(output_u8) / 255;
    else
        output_img = output_u8;
    end
end
