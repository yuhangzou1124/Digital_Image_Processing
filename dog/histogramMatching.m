function output_img = histogramMatching(input_img, target_hist)
    % 直方图规定化 (Histogram Matching)
    % 输入:
    %   input_img: 输入图像 (灰度图像)
    %   target_hist: 目标直方图 (1x256 向量)
    % 输出:
    %   output_img: 规定化后的图像
    
    % 确保输入是 uint8
    if isa(input_img, 'double')
        input_img = uint8(input_img * 255);
    end
    
    [rows, cols] = size(input_img);
    
    % 1. 计算输入图像的直方图和累积分布函数 (CDF)
    hist_input = imhist(input_img);
    cdf_input = cumsum(hist_input) / numel(input_img);
    
    % 2. 计算目标直方图的 CDF
    % 确保 target_hist 是归一化的
    target_hist = target_hist / sum(target_hist);
    cdf_target = cumsum(target_hist);
    
    % 3. 建立映射关系
    % 对于每个输入灰度级 r_k，找到一个输出灰度级 z_k，使得 G(z_k) 最接近 T(r_k)
    map = zeros(256, 1, 'uint8');
    for i = 1:256
        % 寻找 cdf_target 中最接近 cdf_input(i) 的值的索引
        [~, idx] = min(abs(cdf_target - cdf_input(i)));
        map(i) = idx - 1; % 索引从1开始，灰度值从0开始
    end
    
    % 4. 应用映射
    output_img = map(double(input_img) + 1);
    
    % 保持输出维度一致
    output_img = reshape(output_img, rows, cols);
end
