function output_img = shearImageRGB(img, k_x, k_y)
    % 输入：img - 原始图像 (double类型)
    %        k_x, k_y - 错切因子
    % 输出：output_img - 错切后的图像 (uint8类型)

    % 获取图像尺寸
    [rows, cols, channels] = size(img);

    % 计算新的图像尺寸
    new_cols = round(cols + abs(k_x) * rows);
    new_rows = round(rows + abs(k_y) * cols);

    % 初始化输出图像
    output_img =zeros(new_rows, new_cols, channels);

    % 错切变换公式
    for x = 1:new_cols
        for y = 1:new_rows
            % 逆变换计算原始坐标
            x_src = (x - 1 - k_x * (y - 1)) / (1 - k_x * k_y); 
            y_src = (y - 1 - k_y * (x - 1)) / (1 - k_x * k_y);

            % 如果计算得到的坐标在原图像范围内，则进行插值
            if x_src >= 1 && x_src <= cols && y_src >= 1 && y_src <= rows
                for c = 1:channels
                    % 双线性插值
                    x1 = floor(x_src); x2 = ceil(x_src);
                    y1 = floor(y_src); y2 = ceil(y_src);

                    % 边界检查
                    x1 = max(1, x1); x2 = min(cols, x2);
                    y1 = max(1, y1); y2 = min(rows, y2);

                    % 获取插值所需的四个像素
                    Q11 = img(y1, x1, c);
                    Q12 = img(y1, x2, c);
                    Q21 = img(y2, x1, c);
                    Q22 = img(y2, x2, c);

                    % 计算插值权重
                    a = x_src - x1;
                    b = y_src - y1;

                    % 双线性插值公式
                    value = (1 - a) * (1 - b) * Q11 + a * (1 - b) * Q12 + (1 - a) * b * Q21 + a * b * Q22;
                    output_img(y, x, c) = value;
                end
            else
                % 如果坐标超出原图像范围，填充为白色
                output_img(y, x, :) = 255;
            end
        end
    end

    % 将输出图像转换为 uint8 类型
    output_img = uint8(output_img);
end

