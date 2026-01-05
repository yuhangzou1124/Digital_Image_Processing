function [dogMask, extracted_img] = targetExtraction_KMeans(I)
    % targetExtraction 对目标图片进行目标提取
    %
    % 输入：
    %   I - 输入图像，可以是彩色图像或灰度图像
    %
    % 输出：
    %   dogMask - 二值掩码，前景（目标）为1，背景为0
    %   extracted_img - 应用掩码后的彩色图像，背景为黑色，前景为原色


    % 检查输入图像是否为彩色图像，如果是，转换为 Lab 颜色空间
    if size(I, 3) == 3
        I_lab = rgb2lab(I);
    else
        I_lab = I;
    end

    % 将图像重塑为二维矩阵，每行是一个像素的特征
    if size(I_lab, 3) == 3
        pixels = reshape(I_lab, [], 3);
    else
        pixels = double(I_lab(:));
    end

    % 设置聚类数目为2（前景和背景）
    K = 2;

    % 应用 K-means 聚类
    fprintf('正在进行 K-means 聚类，请稍候...\n');
    [cluster_idx, ~] = kmeans(pixels, K, 'Replicates', 10, 'MaxIter', 400);

    % 将聚类结果重新转换为图像格式
    clusterImage = reshape(cluster_idx, size(I,1), size(I,2));

    % 显示聚类结果供用户选择前景类别
    hFig = figure('Name','K-means 聚类结果','NumberTitle','off','Visible','on');
    hAx = axes('Parent',hFig);
    imshow(label2rgb(clusterImage),'Parent',hAx);
    title(hAx,'K-means 聚类结果');

    % 让用户点击图像中的一个点以选择前景类别
    disp('请点击目标所在的区域以选择前景类别...');
    [x, y] = ginput(1);
    if isempty(x) || isempty(y) || any(isnan([x y]))
        if isvalid(hFig)
            close(hFig);
        end
        error('未选择前景类别点');
    end
    x = min(max(round(x),1), size(clusterImage,2));
    y = min(max(round(y),1), size(clusterImage,1));

    % 获取点击点的类别
    selectedCluster = clusterImage(y, x);

    % 创建二值掩码
    dogMask = clusterImage == selectedCluster;

    % 填充前景区域中的孔洞
    dogMask = imfill(dogMask, 'holes');

    % 移除小的噪声区域
    dogMask = bwareaopen(dogMask, 500);

    % 关闭聚类结果图像
    if isvalid(hFig)
        close(hFig);
    end

    % 应用掩膜到原始彩色图像
    if size(I, 3) == 3
        extracted_img = I;
        extracted_img(repmat(~dogMask, [1, 1, 3])) = 0;
    else
        % 对于灰度图像，直接将非目标区域设置为0
        extracted_img = I;
        extracted_img(~dogMask) = 0;
    end

end


