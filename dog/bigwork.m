function varargout = bigwork(varargin)
% BIGWORK MATLAB code for bigwork.fig
%      BIGWORK, by itself, creates a new BIGWORK or raises the existing
%      singleton*.
%
%      H = BIGWORK returns the handle to a new BIGWORK or the handle to
%      the existing singleton*.
%
%      BIGWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BIGWORK.M with the given input arguments.
%
%      BIGWORK('Property','Value',...) creates a new BIGWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bigwork_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bigwork_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bigwork

% Last Modified by GUIDE v2.5 03-Jan-2026 23:53:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bigwork_OpeningFcn, ...
                   'gui_OutputFcn',  @bigwork_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end

% --- Executes just before bigwork is made visible.
function bigwork_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bigwork (see VARARGIN)

% Choose default command line output for bigwork
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bigwork wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(hObject,'Resize','off');
if isfield(handles,'axes1'),    axis(handles.axes1,'off');    set(handles.axes1,'XTick',[],'YTick',[],'Box','off'); end
% if isfield(handles,'axes11'),   axis(handles.axes11,'off');   set(handles.axes11,'XTick',[],'YTick',[],'Box','off'); end
if isfield(handles,'axes4'),    axis(handles.axes4,'off');    set(handles.axes4,'XTick',[],'YTick',[],'Box','off'); end
if isfield(handles,'axes6'),    axis(handles.axes6,'off');    set(handles.axes6,'XTick',[],'YTick',[],'Box','off'); end
if isfield(handles,'axes8'),    axis(handles.axes8,'off');    set(handles.axes8,'XTick',[],'YTick',[],'Box','off'); end
if isfield(handles,'axes3'),    delete(handles.axes3); end
if isfield(handles,'axes4'),    delete(handles.axes4); end
if isfield(handles,'axes5'),    delete(handles.axes5); end
if isfield(handles,'axes6'),    delete(handles.axes6); end
if isfield(handles,'axes7'),    delete(handles.axes7); end
if isfield(handles,'axes8'),    delete(handles.axes8); end
if isfield(handles,'axes9'),    delete(handles.axes9); end
if isfield(handles,'pushbutton4'), set(handles.pushbutton4,'Visible','off'); end
if isfield(handles,'pushbutton14'), set(handles.pushbutton14,'Visible','off'); end
if isfield(handles,'pushbutton15'), set(handles.pushbutton15,'Visible','off'); end
if isfield(handles,'pushbutton4'), delete(handles.pushbutton4); end
if isfield(handles,'pushbutton14'), delete(handles.pushbutton14); end
if isfield(handles,'pushbutton15'), delete(handles.pushbutton15); end

% 初始化所有功能按钮为不选中状态
if isfield(handles, 'check5'), set(handles.check5, 'Value', 0); end
if isfield(handles, 'checkbox6'), set(handles.checkbox6, 'Value', 0); end
if isfield(handles, 'radiobutton13'), set(handles.radiobutton13, 'Value', 0); end
if isfield(handles, 'checkbox7'), set(handles.checkbox7, 'Value', 0); end
if isfield(handles, 'radiobutton2'), set(handles.radiobutton2, 'Value', 0); end
if isfield(handles, 'checkbox10'), set(handles.checkbox10, 'Value', 0); end
if isfield(handles, 'checkbox11'), set(handles.checkbox11, 'Value', 0); end
if isfield(handles, 'checkbox12'), set(handles.checkbox12, 'Value', 0); end
if isfield(handles, 'checkbox13'), set(handles.checkbox13, 'Value', 0); end
if isfield(handles, 'checkbox14'), set(handles.checkbox14, 'Value', 0); end
if isfield(handles, 'radiobutton8'), set(handles.radiobutton8, 'Value', 0); end
if isfield(handles, 'radiobutton9'), set(handles.radiobutton9, 'Value', 0); end
if isfield(handles, 'checkbox17'), set(handles.checkbox17, 'Value', 0); end
if isfield(handles, 'checkbox18'), set(handles.checkbox18, 'Value', 0); end
if isfield(handles, 'radiobutton15'), set(handles.radiobutton15, 'Value', 0); end
if isfield(handles, 'radiobutton16'), set(handles.radiobutton16, 'Value', 0); end
if isfield(handles, 'checkbox921'), set(handles.checkbox921, 'Value', 0); end
if isfield(handles, 'checkbox22'), set(handles.checkbox22, 'Value', 0); end
if isfield(handles, 'radiobutton22'), set(handles.radiobutton22, 'Value', 0); end
if isfield(handles, 'radiobutton24'), set(handles.radiobutton24, 'Value', 0); end
if isfield(handles, 'checkbox9'), set(handles.checkbox9, 'Value', 0); end
if isfield(handles, 'checkbox3'), set(handles.checkbox3, 'Value', 0); end
if isfield(handles, 'checkbox4'), set(handles.checkbox4, 'Value', 0); end
if isfield(handles, 'checkbox2'), set(handles.checkbox2, 'Value', 0); end
if isfield(handles, 'checkbox_he'), set(handles.checkbox_he, 'Value', 0); end
if isfield(handles, 'checkbox_clahe'), set(handles.checkbox_clahe, 'Value', 0); end

panels = findall(hObject,'Type','uipanel');
for k = 1:numel(panels)
    try
        t = get(panels(k),'Title');
    catch
        t = '';
    end
    if ~isempty(t) && (contains(t,'直方图') || contains(t,'Histogram'))
        delete(panels(k));
    end
end
if isfield(handles,'axes2'),    axis(handles.axes2,'off');    set(handles.axes2,'XTick',[],'YTick',[],'Box','off'); end
end

% --- Outputs from this function are returned to the command line.
function varargout = bigwork_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in pushbutton1.
% 选择图片按钮
function pushbutton1_Callback(hObject, eventdata, handles)
    [filename, path] = uigetfile({'*.jpg;*.png'}, '请选择一张图片');
     % 如果用户没有取消选择，filename 和 path 不为空
    if filename ~= 0
        % 构建完整的文件路径
        fullpath = fullfile(path, filename);        
        % 读取图片
        img = imread(fullpath);

        % 去除路径末尾的斜杠（如果有的话）
        if path(end) == filesep
            path = path(1:end-1);  % 移除末尾的斜杠
        end
        
        % 使用 strsplit 通过文件分隔符分割路径，并获取最后一部分作为文件夹名称
        path_parts = strsplit(path, filesep);
        parent_dir_name = path_parts{end};  % 获取最后一部分，即文件夹名

        
        % 将图片存储在 handles 结构中，以便其他回调函数可以访问
        handles.img = img; % 将图片保存在 handles 结构中的 img 字段
        handles.source_img = img;
        handles.parent_dir_name = parent_dir_name; % 将父目录保存在 handles 结构中的 parent_dir 字段
        guidata(hObject, handles); % 更新 handles


         % 在 text25 控件中显示分类
        set(handles.text25, 'String', parent_dir_name); 

        % 在 GUI 的 axes 控件中显示图片
        cla(handles.axes1,'reset');
        imshow(img,'Parent',handles.axes1);
        axis(handles.axes1,'image');
        axis(handles.axes1,'off');


        % 转为灰度图
        % grayImage = rgb_to_gray(img);
        % cla(handles.axes11,'reset');
        % imshow(grayImage,'Parent',handles.axes11);
        % axis(handles.axes11,'image');
        % axis(handles.axes11,'off');

        guidata(hObject, handles); % 更新 handles 数据

        


    else
        % 如果没有选择文件，显示消息
        disp('未找到图片');
    end
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    % 1. 验证互斥逻辑 (Mutual Exclusivity Validation)
    
    % --- 对比度增强 (Contrast Enhancement) ---
    % Group: check5(Linear), checkbox6(Log), radiobutton13(Exp), checkbox7(Piecewise)
    contrastGroup = [
        get(handles.check5, 'Value'), ...
        get(handles.checkbox6, 'Value'), ...
        get(handles.radiobutton13, 'Value'), ...
        get(handles.checkbox7, 'Value')
    ];
    if sum(contrastGroup) > 1
        errordlg('对比度增强只能选择一种方法！', '选择错误');
        return;
    end
    
    % --- 加噪声 (Add Noise) ---
    % Group: radiobutton2(Gaussian), checkbox10(Salt & Pepper)
    noiseGroup = [
        get(handles.radiobutton2, 'Value'), ...
        get(handles.checkbox10, 'Value')
    ];
    if sum(noiseGroup) > 1
        errordlg('图像加噪只能选择一种方法！', '选择错误');
        return;
    end
    
    % --- 滤波 (Filter) ---
    % Group: checkbox11(Mean), checkbox12(Median), checkbox13(Gaussian), 
    %        checkbox14(Bilateral), radiobutton8(Ideal LP), radiobutton9(Exp LP), checkbox17(Fuzzy)
    filterGroup = [
        get(handles.checkbox11, 'Value'), ...
        get(handles.checkbox12, 'Value'), ...
        get(handles.checkbox13, 'Value'), ...
        get(handles.checkbox14, 'Value'), ...
        get(handles.radiobutton8, 'Value'), ...
        get(handles.radiobutton9, 'Value'), ...
        get(handles.checkbox17, 'Value')
    ];
    if sum(filterGroup) > 1
        errordlg('滤波只能选择一种方法！', '选择错误');
        return;
    end
    
    % --- 边缘提取 (Edge Extraction) ---
    % Group: checkbox18(Robert), radiobutton15(Prewitt), radiobutton16(Sobel), checkbox921(Laplace)
    edgeGroup = [
        get(handles.checkbox18, 'Value'), ...
        get(handles.radiobutton15, 'Value'), ...
        get(handles.radiobutton16, 'Value'), ...
        get(handles.checkbox921, 'Value')
    ];
    if sum(edgeGroup) > 1
        errordlg('边缘提取只能选择一种算子！', '选择错误');
        return;
    end
    
    % --- 目标提取 (Target Extraction) ---
    % Group: checkbox22(K-Means), radiobutton22(Watershed), radiobutton24(Bimodal)
    targetGroup = [
        get(handles.checkbox22, 'Value'), ...
        get(handles.radiobutton22, 'Value'), ...
        get(handles.radiobutton24, 'Value')
    ];
    if sum(targetGroup) > 1
        errordlg('目标提取只能选择一种方法！', '选择错误');
        return;
    end

    % 2. 执行处理
    apply_processing(handles);
end

% --- Deprecated old code
function unused_pushbutton2_Callback(hObject, eventdata, handles)
    % 检查是否加载了图像
    if ~isfield(handles, 'img') || isempty(handles.img)
        errordlg('请先选择一张图片！', '错误');
        return;
    end

    % 获取复选框状态
    isResizeChecked = get(handles.checkbox2, 'Value');  % 判断是否进行缩放
    isRotateChecked = get(handles.checkbox3, 'Value');  % 判断是否进行旋转
    isShearChecked = get(handles.checkbox4, 'Value');   % 判断是否进行错切
    isAddNoiseChecked = get(handles.checkbox7, 'Value');  % 判断是否选择加噪
    isFilterChecked = get(handles.checkbox8, 'Value'); % 判断是否进行滤波（复选框）
    isMirrorChecked = get(handles.checkbox9, 'Value'); % 判断是否进行镜像
    isContrastChecked = get(handles.checkbox10, 'Value');  % 判断是否勾选对比度增强
    isEdgeExtractionChecked = get(handles.checkbox11, 'Value');  % 判断是否进行边缘提取
    isTargetExtractionChecked = get(handles.checkbox12, 'Value');  % 判断是否进行目标提取
    isGeometricTransformationChecked = get(handles.checkbox14, 'Value'); % 判断是否进行几何变换

     % 获取镜像类型（水平或垂直）
    if isMirrorChecked
        mirrorType = get(handles.popupmenu3, 'Value'); % 获取下拉框的值，1为水平镜像，2为垂直镜像
    else
        mirrorType = 0; % 如果没有勾选镜像，设置为0
    end

    % 获取缩放倍数（如果需要）
    kx = str2double(get(handles.edit1, 'String')); % 宽度缩放倍数
    ky = str2double(get(handles.edit3, 'String')); % 高度缩放倍数
    
    % 获取旋转角度（如果需要）
    angle = str2double(get(handles.edit2, 'String')); % 旋转角度

    % 获取错切因子（如果需要）
    shearFactorx = str2double(get(handles.edit4, 'String')); % 错切因子
    shearFactory = str2double(get(handles.edit5, 'String')); % 错切因子

    
    % 获取噪声类型（高斯噪声或椒盐噪声）
    isGaussianNoise = get(handles.radiobutton2, 'Value');  % 高斯噪声
    isSaltAndPepperNoise = get(handles.checkbox10, 'Value');  % 椒盐噪声
    % 获取滤波器大小（用于均值滤波和中值滤波）
    filterSize = str2double(get(handles.edit6, 'String')); 

     % 获取选择的对比度增强类型
    isLinear = get(handles.check5, 'Value');  % 判断是否选择线性变换
    isLogarithmic = get(handles.checkbox6, 'Value');  % 判断是否选择对数变换
    isExponential = get(handles.radiobutton13, 'Value');  % 判断是否选择指数变换
    isPiecewiseLinear = get(handles.checkbox7,'Value'); % 判断是否选择分段线性变换
    % 获取算子类型
    isRobertChecked = get(handles.checkbox18, 'Value');  % 判断是否选择Robert算子
    isPrewittChecked = get(handles.radiobutton15, 'Value'); % 判断是否选择Prewitt算子
    isSobelChecked = get(handles.radiobutton16, 'Value');   % 判断是否选择Sobel算子
    isLaplaceChecked = get(handles.checkbox921, 'Value'); % 判断是否选择拉普拉斯算子

    isKMean = get(handles.checkbox22, 'Value');% 判断是否选择聚类分割
    isWaterRegion = get(handles.radiobutton22,'value');
    isBimodalThresholding = get(handles.radiobutton24,'value');

    % 图像初始化
    img = handles.img;

    % 根据复选框状态进行不同操作



     % 如果选择了边缘提取并且选择了Robert算子
    if isEdgeExtractionChecked
        if isRobertChecked
            % 执行Robert算子的边缘提取
            img = robertEdgeDetection(img);
        elseif isPrewittChecked
            % 执行Prewitt算子的边缘提取
            img = prewittEdgeDetection(img);
        elseif isSobelChecked
            % 执行Sobel算子的边缘提取
            img = sobelEdgeDetection(img);
        elseif isLaplaceChecked
            % 执行拉普拉斯算子的边缘提取
            img = laplaceEdgeDetection(img);
        
        else
            errordlg('请先选择边缘提取方法！', '错误');
            return;
        end
    end



    % 如果勾选了对比度增强
    if isContrastChecked
        % 根据用户选择的增强方式调用相应的函数
        if size(img, 3) == 3
            img = rgb2gray(img); % 转换为灰度图像
        end

        if isLinear
            % 调用线性对比度增强函数
            img = linearTransform(img);

        elseif isLogarithmic
            % 调用对数变换函数
            img = logTransform(img);

        elseif isExponential
            % 调用指数变换函数
            img = expTransform(img);
        elseif isPiecewiseLinear
            % 调用分段线性灰度变换函数
            img = piecewiseLinearTransform(img);
            % img = threeSegmentLinearTransform(img);

        else
            % 如果没有选择有效的增强方式
            errordlg('请先选择对比度增强类型！', '错误');
            return;
        end
    end






    if isAddNoiseChecked
        % 如果选择了加噪声
        if isGaussianNoise
            % 添加高斯噪声
            m = str2double(get(handles.edit13,'String'));
            v = str2double(get(handles.edit14,'String'));
            img = addGaussianNoise(img, m,v);
        elseif isSaltAndPepperNoise
            % 添加椒盐噪声
            d = str2double(get(handles.edit15,'String'));
            img = addSaltAndPepperNoise(img, d);
        else
            % 如果没有选择噪声类型，弹出警告
            errordlg('请先选择噪声类型！', '错误');
            return;
        end
    end

    % 如果选择了滤波
    if isFilterChecked
        % 判断选择的滤波类型
        if get(handles.checkbox11, 'Value')  % 如果选择均值滤波
            if isnan(filterSize) || filterSize <= 0
                errordlg('请输入有效的滤波器大小！', '错误');
                return;
            end
            % 执行均值滤波
            img = meanFilter(img, filterSize);
        elseif get(handles.checkbox12, 'Value')  % 如果选择中值滤波
            if isnan(filterSize) || filterSize <= 0
                errordlg('请输入有效的滤波器大小！', '错误');
                return;
            end
            % 执行中值滤波
            img = medianFilter(img, filterSize);

        elseif get(handles.checkbox13, 'Value')  % 如果选择高斯滤波
            if isnan(filterSize) || filterSize <= 0
                errordlg('请输入有效的滤波器大小！', '错误');
                return;
            end
            % 获取标准差（假设你有一个输入框获取sigma值）
            sigma = str2double(get(handles.edit7, 'String')); % 获取标准差
            % 执行高斯滤波
            img = gaussianFilter(img, filterSize, sigma);

        elseif get(handles.checkbox14, 'Value')  % 如果选择双边滤波
            if isnan(filterSize) || filterSize <= 0
                errordlg('请输入有效的滤波器大小！', '错误');
                return;
            end
            % 获取双边滤波的参数
            sigma_d = str2double(get(handles.edit8, 'String'));  % 获取空间域的标准差
            sigma_r = str2double(get(handles.edit9, 'String'));  % 获取灰度域的标准差
            
            % 执行双边滤波
            img = bilateralFilter(img, filterSize, sigma_d, sigma_r);

        elseif get(handles.radiobutton8, 'Value')  % 如果选择理想低通滤波
            % 获取截止频率
            cutoffFreq = str2double(get(handles.edit10, 'String'));
            % 执行理想低通滤波
            img = idealLowPassFilter(img, cutoffFreq);
        elseif get(handles.radiobutton9, 'Value')  % 如果选择指数低通滤波
            % 获取截止频率
            D0 = str2double(get(handles.edit10, 'String'));
            % 执行指数低通滤波
            img = exponentialLowPassFilter(img, D0);
            elseif get(handles.checkbox17, 'Value')  % 如果选择模糊均值滤波
                % 调用 fuzzy_average_filter
                img = fuzzy_average_filter(img, filterSize);



        else
            % 如果没有选择滤波类型，弹出警告
            errordlg('请先选择滤波类型！', '错误');
            return;
        end
    end
    if isGeometricTransformationChecked
        if isMirrorChecked
            % 如果选择了镜像
            if mirrorType == 1
                % 水平镜像
                img = horizontal_flip(img);
            elseif mirrorType == 2
                % 垂直镜像
                img = vertical_flip(img);
            end
        end

        if isRotateChecked
            % 如果选择了旋转
            if isnan(angle)
                errordlg('请输入有效的旋转角度！', '错误');
                return;
            end
            img = rotateImage(double(img), angle);
        end


        if isShearChecked
            % 如果选择了错切
            if isnan(shearFactorx)||isnan(shearFactory)
                errordlg('请输入有效的错切因子！', '错误');
                return;
            end
            img = shearImageRGB(double(img), shearFactorx,shearFactory);
        end


        if isResizeChecked
            % 如果选择了缩放
            if isnan(kx) || isnan(ky) || kx <= 0 || ky <= 0
                errordlg('请输入有效的缩放倍数（正数）！', '错误');
                return;
            end
            % img = bilinearResize(double(img), kx, ky);
            img = resizeColorImage(img, kx, ky);
        end
    end

    handles.processed_img = img;
    guidata(hObject, handles);  % 更新handles


    % 如果选择了目标提取
    if isTargetExtractionChecked && isKMean
        [mask,img] = targetExtraction_KMeans(img);
        handles.target_img = img;  % 将结果存储到handles结构体中
        guidata(hObject, handles);  % 更新handles数据
    end

    if isTargetExtractionChecked && isWaterRegion
        img = targetExtract_WatershedRegion(img);
        handles.target_img = img;  % 将结果存储到handles结构体中
        guidata(hObject, handles);  % 更新handles数据
    end


    if isTargetExtractionChecked && isBimodalThresholding
        img = targetExtract_BimodalThresholding(img);
        handles.target_img = img;  % 将结果存储到handles结构体中
        guidata(hObject, handles);  % 更新handles数据
    end
    
    
    % 显示结果
    cla(handles.axes2,'reset');
    imshow(img,[],'Parent',handles.axes2);
    axis(handles.axes2,'image');
    axis(handles.axes2,'off');





end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% 获取当前图像
    if isfield(handles, 'img')
        img = handles.img; % 从 handles 获取原始图像

        % 转换为灰度图（如需要）
        if size(img, 3) == 3
            grayImg = rgb2gray(img);
        else
            grayImg = img;
        end

        % 线性变换
        linearImg = linearTransform(grayImg);

        % 对数变换
        logImg = logTransform(grayImg);

        % 指数变换
        expImg = expTransform(grayImg);

        % 在新窗口中展示结果
        hFig = figure;
        set(hFig, 'Name', '对比度增强结果', 'NumberTitle', 'off'); % 修改窗口标题

        subplot(2, 2, 1);
        imshow(grayImg);
        title('原始图像');

        subplot(2, 2, 2);
        imshow(linearImg);
        title('线性变换');

        subplot(2, 2, 3);
        imshow(logImg);
        title('对数变换');

        subplot(2, 2, 4);
        imshow(expImg);
        title('指数变换');
    else
        errordlg('请先加载图像！', '错误');
    end
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % apply_processing(handles);
end



% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
    % apply_processing(handles);
end


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
    % apply_processing(handles);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
    % apply_processing(handles);
end
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
    apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
    apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
end



function edit6_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% Set default value for filter size
set(hObject, 'String', '3');
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % apply_processing(handles);
end
% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox7.加噪
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
    % apply_processing(handles);
end

% --- Executes on button press in checkbox8.滤波
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
    % apply_processing(handles);
end


% --- Executes on button press in checkbox12.
function radiobutton7_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function radiobutton3_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function radiobutton2_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end



function edit7_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% Set default value for Gaussian sigma
set(hObject, 'String', '1.0');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% Set default value for Bilateral filter sigma_d (spatial)
set(hObject, 'String', '3.0');
end


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% Set default value for Bilateral filter sigma_r (range)
set(hObject, 'String', '15.0');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% Set default value for Low Pass filter cutoff frequency
set(hObject, 'String', '30');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
    % apply_processing(handles);
end

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10
    % apply_processing(handles);
end


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11
    % apply_processing(handles);
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
    % 检查是否已有处理后的图像
    if isfield(handles, 'processed_img')
        processed_img = handles.processed_img;
        % 如果是灰度图像，转换为三通道
        if size(processed_img, 3) == 1
            processed_img = repmat(processed_img, [1, 1, 3]);  % 复制灰度图像到三个通道
        end
        save_dir = fullfile(tempdir, 'DigitalImageProcessing');
        if ~exist(save_dir, 'dir')
            mkdir(save_dir);
        end
        image_save_path = fullfile(save_dir, 'processed_img.jpg');
        img_to_save = processed_img;
        if size(img_to_save, 3) == 1
            img_to_save = repmat(img_to_save, [1, 1, 3]);
        end
        if isa(img_to_save, 'double')
            vmin = min(img_to_save(:));
            vmax = max(img_to_save(:));
            if vmax <= 1 && vmin >= 0
                img_to_save = uint8(round(img_to_save * 255));
            else
                img_to_save = uint8(max(min(img_to_save, 255), 0));
            end
        elseif islogical(img_to_save)
            img_to_save = uint8(img_to_save) * 255;
        end
        try
            imwrite(img_to_save, image_save_path);
        catch
            [file, path] = uiputfile({'*.jpg','JPEG (*.jpg)';'*.png','PNG (*.png)';'*.bmp','Bitmap (*.bmp)'}, '选择保存位置', 'processed_img.jpg');
            if isequal(file,0) || isequal(path,0)
                errordlg('图像保存失败，未选择保存路径。','错误');
                return;
            end
            image_save_path = fullfile(path, file);
            imwrite(img_to_save, image_save_path);
        end
        
        % model_path = 'checkpoints/checkpoint_epoch_19.pt';
        % model_path = 'D:\_laboratory\pythonProject\DIP\checkpoints\checkpoint_epoch_19.pt';
        % model_path = 'D:\_laboratory\pythonProject\DIP\checkpoints\checkpoint_epoch_19.pt';
        model_path = 'c:\Users\34566\matlab-code\image_processing\dog\checkpoints\checkpoint_dog.pt';
        env = pyenv;
        if env.Status == "NotLoaded"
            try
                pyenv('ExecutionMode','OutOfProcess');
            catch
            end
        end
        p = fileparts(mfilename('fullpath'));
        try
            sys_path = cell(py.list(py.sys.path));
            path_cell = cellfun(@char, sys_path, 'UniformOutput', false);
            if ~any(strcmp(path_cell, p))
                py.sys.path.append(p);
            end
        catch
        end
        try
            model = py.importlib.import_module('model_pred');
        catch
            errordlg('Python 环境未配置或版本不受支持。请使用 pyenv 配置支持的 CPython。','错误');
            return;
        end
        tic;
        try
            res = model.predict_with_checkpoint(model_path, image_save_path);
        catch ME
            errordlg(char(ME.message),'错误');
            return;
        end
        elapsedTime = toc;
        res = string(res);  % 将 Python 字符串转换为 MATLAB 字符串
        set(handles.text23,"String",res);
        set(handles.text43, 'String', [num2str(elapsedTime, '%.5f'), ' 秒']);

        % 获取 text25 的内容
        expected_result = get(handles.text25, "String");
        % 判断分类结果是否正确
        if strcmp(res, expected_result)
            set(handles.text38, "String", "识别正确");
            set(handles.text38, "ForegroundColor", [0 0 0]);  % 设置为黑色字体
        else
            set(handles.text38, "String", "识别错误");
            set(handles.text38, "ForegroundColor", [1 0 0]);  % 设置为红色字体
        end

    else
        msgbox('请先选择并处理图像！', '错误', 'error');
    end

end
    


function edit12_Callback(hObject, eventdata, handles)


end

% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12
    % apply_processing(handles);
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% 获取当前axes中的图像
        ax = handles.axes2;
        img = getimage(ax);  % 从axes中获取图像
        
        % 如果axes没有图像，提示用户
        if isempty(img)
            msgbox('No image to save!', 'Error', 'error');
            return;
        end
        
        % 打开保存文件对话框
        [file, path] = uiputfile({'*.png';'*.jpg';'*.tiff';'*.bmp'}, 'Save Image As');
        
        % 如果用户没有取消，保存图像
        if ischar(file)
            full_path = fullfile(path, file);
            imwrite(img, full_path);  % 保存图像
            disp(['Image saved as: ', full_path]);
        else
            disp('Save operation was cancelled.');
        end
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
 % 对源图像 (source_img) 和目标图像 (target_img) 进行LBP处理

    % 检查是否存在 source_img
    if isfield(handles, 'source_img')
        
        source_img = handles.source_img;
        
        % 确定目标图像：优先处理后图像 -> 其次目标提取图像 -> 最后回退到源图像
        if isfield(handles, 'processed_img')
            target_img = handles.processed_img;
        elseif isfield(handles, 'target_img')
            target_img = handles.target_img;
        else
            target_img = source_img; % 如果没有处理过，就对比源图像自己
        end

        lbp_source = computeLBP(source_img);
        lbp_target = computeLBP(target_img);
        
         % 创建一个新的figure，并设置窗口名称
        figure('Name', 'LBP特征提取', 'NumberTitle', 'off'); % 设置窗口名称为 'LBP特征提取'
        
        % 显示源图像的LBP特征图
        subplot(1, 2, 1); 
        imshow(lbp_source);
        title('源图像 LBP 特征提取');
        
        % 显示目标图像的LBP特征图
        subplot(1, 2, 2); 
        imshow(lbp_target);
        title('目标图像 LBP 特征提取');

       
    else
        % 如果没有找到源图像，则弹出提示
        msgbox('请先选择一张图片！', '错误', 'error');
    end

end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
 % 检查是否存在 source_img
    if isfield(handles, 'source_img')
        
        source_img = handles.source_img;
        
        % 确定目标图像：优先处理后图像 -> 其次目标提取图像 -> 最后回退到源图像
        if isfield(handles, 'processed_img')
            target_img = handles.processed_img;
        elseif isfield(handles, 'target_img')
            target_img = handles.target_img;
        else
            target_img = source_img; % 如果没有处理过，就对比源图像自己
        end

        step =16;
        K =9;
        % 对源图像进行 HOG 特征提取
        [feature_source, image_hog_source] = computeHOG(source_img,step,K);
        [feature_target, image_hog_target] = computeHOG(target_img,step,K);



        % HOG 特征提取显示
        figure('Name', 'HOG特征提取', 'NumberTitle', 'off'); 
        subplot(1, 2, 1);
        imshow(image_hog_source,[]);
        title('源图像 HOG 特征提取');

        subplot(1, 2, 2);
        imshow(image_hog_target,[]);
        title('目标图像 HOG 特征提取');



    else
        % 如果没有找到源图像，则弹出提示
        msgbox('请先选择一张图片！', '错误', 'error');
    end
end


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22
    % apply_processing(handles);
end


% --- Executes on button press in radiobutton22.
function radiobutton22_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton22
    % apply_processing(handles);
end


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14
    % apply_processing(handles);
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double
    % apply_processing(handles);
end

% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in check5.
%function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to check5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check5


% --- Executes on button press in check5.
function check5_Callback(hObject, eventdata, handles)
% hObject    handle to check5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check5
    % apply_processing(handles);
end

function checkbox6_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function radiobutton13_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function checkbox18_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function radiobutton15_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function radiobutton16_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function checkbox921_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function radiobutton8_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function radiobutton9_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function checkbox17_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function radiobutton24_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function checkbox13_Callback(hObject, eventdata, handles)
    % apply_processing(handles);
end

function apply_processing(handles)
    % 计时开始
    t_start = tic;

    % 检查是否加载了图像
    if ~isfield(handles, 'source_img') || isempty(handles.source_img)
        return;
    end
    
    img = handles.source_img;
    
    % --- 1. 边缘提取 (Edge Extraction) ---
    % 检查各个边缘提取算子是否被选中
    if isfield(handles, 'checkbox18') && get(handles.checkbox18, 'Value') % Robert
        img = robertEdgeDetection(img);
    elseif isfield(handles, 'radiobutton15') && get(handles.radiobutton15, 'Value') % Prewitt
        img = prewittEdgeDetection(img);
    elseif isfield(handles, 'radiobutton16') && get(handles.radiobutton16, 'Value') % Sobel
        img = sobelEdgeDetection(img);
    elseif isfield(handles, 'checkbox921') && get(handles.checkbox921, 'Value') % Laplace
        img = laplaceEdgeDetection(img);
    end
    
    % --- 2. 对比度增强 (Contrast Enhancement) ---
    % Removed forced grayscale conversion for contrast enhancement to support color processing
    
    if isfield(handles, 'check5') && get(handles.check5, 'Value') % Linear
        if size(img, 3) == 3
            img_lab = rgb2lab(img);
            max_val = 100;
            L = img_lab(:,:,1) / max_val;
            L = double(L); % Ensure double for transform
            % Linear transform usually expects 0-255 or 0-1. 
            % Let's map L (0-1) to 0-255 for transform then back
            L_255 = uint8(L * 255);
            L_trans = linearTransform(L_255);
            img_lab(:,:,1) = double(L_trans)/255 * max_val;
            img = lab2rgb(img_lab) * 255;
            img = uint8(img);
        else
            img = linearTransform(img);
        end
    elseif isfield(handles, 'checkbox6') && get(handles.checkbox6, 'Value') % Logarithmic
        if size(img, 3) == 3
            img_lab = rgb2lab(img);
            max_val = 100;
            L = img_lab(:,:,1) / max_val;
            L_255 = uint8(L * 255);
            L_trans = logTransform(L_255);
            img_lab(:,:,1) = double(L_trans)/255 * max_val;
            img = lab2rgb(img_lab) * 255;
            img = uint8(img);
        else
            img = logTransform(img);
        end
    elseif isfield(handles, 'radiobutton13') && get(handles.radiobutton13, 'Value') % Exponential
        if size(img, 3) == 3
            img_lab = rgb2lab(img);
            max_val = 100;
            L = img_lab(:,:,1) / max_val;
            L_255 = uint8(L * 255);
            L_trans = expTransform(L_255);
            img_lab(:,:,1) = double(L_trans)/255 * max_val;
            img = lab2rgb(img_lab) * 255;
            img = uint8(img);
        else
            img = expTransform(img);
        end
    elseif isfield(handles, 'checkbox7') && get(handles.checkbox7, 'Value') % Piecewise Linear
        if size(img, 3) == 3
            img_lab = rgb2lab(img);
            max_val = 100;
            L = img_lab(:,:,1) / max_val;
            L_255 = uint8(L * 255);
            L_trans = piecewiseLinearTransform(L_255);
            img_lab(:,:,1) = double(L_trans)/255 * max_val;
            img = lab2rgb(img_lab) * 255;
            img = uint8(img);
        else
            img = piecewiseLinearTransform(img);
        end
    elseif isfield(handles, 'checkbox_he') && get(handles.checkbox_he, 'Value') % Histogram Equalization
        % Note: rgb2gray check above already handles grayscale conversion if needed for basic transforms
        % but for HE/CLAHE we might want to support color by processing Luminance channel
        if size(handles.source_img, 3) == 3 
            % Revert to source color image for HE processing to support color enhancement
            img = handles.source_img; 
            img_lab = rgb2lab(img);
            max_luminosity = 100;
            L = img_lab(:,:,1) / max_luminosity;
            L = histogramEqualization(L); % 使用自定义直方图均衡化
            img_lab(:,:,1) = L * max_luminosity;
            img = lab2rgb(img_lab) * 255;
            img = uint8(img);
        else
            img = histogramEqualization(img); % 使用自定义直方图均衡化
        end
    elseif isfield(handles, 'checkbox_clahe') && get(handles.checkbox_clahe, 'Value') % CLAHE
        if size(handles.source_img, 3) == 3
             % Revert to source color image for CLAHE processing
            img = handles.source_img;
            img_lab = rgb2lab(img);
            max_luminosity = 100;
            L = img_lab(:,:,1) / max_luminosity;
            L = adaptiveHistogramEqualization(L, [8 8], 0.01); % 使用自定义 CLAHE
            img_lab(:,:,1) = L * max_luminosity;
            img = lab2rgb(img_lab) * 255;
            img = uint8(img);
        else
            img = adaptiveHistogramEqualization(img, [8 8], 0.01); % 使用自定义 CLAHE
        end
    end
    
    % --- 3. 加噪声 (Add Noise) ---
    if isfield(handles, 'radiobutton2') && get(handles.radiobutton2, 'Value') % Gaussian Noise
        m = str2double(get(handles.edit13,'String'));
        v = str2double(get(handles.edit14,'String'));
        if isnan(m), m=0; end
        if isnan(v), v=0.01; end
        img = addGaussianNoise(img, m, v);
    elseif isfield(handles, 'checkbox10') && get(handles.checkbox10, 'Value') % Salt & Pepper
        d = str2double(get(handles.edit15,'String'));
        if isnan(d), d=0.05; end
        img = addSaltAndPepperNoise(img, d);
    end
    
    % --- 4. 滤波 (Filter) ---
    filterSize = str2double(get(handles.edit6, 'String'));
    if isnan(filterSize) || filterSize <= 0, filterSize = 3; end % Default
    
    if isfield(handles, 'checkbox11') && get(handles.checkbox11, 'Value') % Mean Filter
        img = meanFilter(img, filterSize);
    elseif isfield(handles, 'checkbox12') && get(handles.checkbox12, 'Value') % Median Filter
        img = medianFilter(img, filterSize);
    elseif isfield(handles, 'checkbox13') && get(handles.checkbox13, 'Value') % Gaussian Filter
        sigma = str2double(get(handles.edit7, 'String'));
        if isnan(sigma), sigma=1; end
        img = gaussianFilter(img, filterSize, sigma);
    elseif isfield(handles, 'checkbox14') && get(handles.checkbox14, 'Value') % Bilateral Filter
        sigma_d = str2double(get(handles.edit8, 'String'));
        sigma_r = str2double(get(handles.edit9, 'String'));
        if isnan(sigma_d), sigma_d=3; end
        if isnan(sigma_r), sigma_r=0.1; end
        img = bilateralFilter(img, filterSize, sigma_d, sigma_r);
    elseif isfield(handles, 'radiobutton8') && get(handles.radiobutton8, 'Value') % Ideal Low Pass
        cutoffFreq = str2double(get(handles.edit10, 'String'));
        if isnan(cutoffFreq), cutoffFreq=30; end
        img = idealLowPassFilter(img, cutoffFreq);
    elseif isfield(handles, 'radiobutton9') && get(handles.radiobutton9, 'Value') % Exponential Low Pass
        D0 = str2double(get(handles.edit10, 'String'));
        if isnan(D0), D0=30; end
        img = exponentialLowPassFilter(img, D0);
    elseif isfield(handles, 'checkbox17') && get(handles.checkbox17, 'Value') % Fuzzy Average
        img = fuzzy_average_filter(img, filterSize);
    end
    
    % --- 5. 几何变换 (Geometric Transformation) ---
    % Mirror
    if isfield(handles, 'popupmenu3')
        mirrorType = get(handles.popupmenu3, 'Value');
        if isfield(handles, 'checkbox9') && get(handles.checkbox9, 'Value')
             if mirrorType == 1
                img = horizontal_flip(img);
            elseif mirrorType == 2
                img = vertical_flip(img);
            end
        end
    end
    
    % Rotate
    if isfield(handles, 'checkbox3') && get(handles.checkbox3, 'Value')
        angle = str2double(get(handles.edit2, 'String'));
        if ~isnan(angle)
            img = rotateImage(double(img), angle);
        end
    end
    
    % Shear
    if isfield(handles, 'checkbox4') && get(handles.checkbox4, 'Value')
        shearFactorx = str2double(get(handles.edit4, 'String'));
        shearFactory = str2double(get(handles.edit5, 'String'));
        if ~isnan(shearFactorx) && ~isnan(shearFactory)
            img = shearImageRGB(double(img), shearFactorx, shearFactory);
        end
    end
    
    % Resize
    if isfield(handles, 'checkbox2') && get(handles.checkbox2, 'Value')
        kx = str2double(get(handles.edit1, 'String'));
        ky = str2double(get(handles.edit3, 'String'));
        if ~isnan(kx) && ~isnan(ky) && kx > 0 && ky > 0
            % Safety check for large scaling factors which might be percentages
            if kx > 5
                 kx = kx / 100;
            end
            if ky > 5
                 ky = ky / 100;
            end
            
            % Final safety check to prevent memory errors
            if kx > 5 || ky > 5
                 % warndlg('缩放倍数过大，已重置为1倍（不缩放）以避免内存错误。', '警告');
                 kx = 1;
                 ky = 1;
            end
            
            img = resizeColorImage(img, kx, ky);
        end
    end
    
    % --- 6. 目标提取 (Target Extraction) ---
    if isfield(handles, 'checkbox22') && get(handles.checkbox22, 'Value') % K-Means
        [mask, img] = targetExtraction_KMeans(img);
        handles.target_img = img;
    elseif isfield(handles, 'radiobutton22') && get(handles.radiobutton22, 'Value') % Watershed
        img = targetExtract_WatershedRegion(img);
        handles.target_img = img;
    elseif isfield(handles, 'radiobutton24') && get(handles.radiobutton24, 'Value') % Bimodal
        img = targetExtract_BimodalThresholding(img);
        handles.target_img = img;
    end
    
    % 更新结果
    handles.processed_img = img;
    guidata(handles.output, handles);
    
    cla(handles.axes2,'reset');
    imshow(img,[],'Parent',handles.axes2);
    axis(handles.axes2,'image');
    axis(handles.axes2,'off');
    
    % --- 7. 计算并显示评价指标 (PSNR & SSIM & Entropy & Time) ---
    % 计算耗时
    elapsed_time = toc(t_start);
    time_str = sprintf('%.4fs', elapsed_time);
    
    % 计算信息熵 (Entropy)
    if size(img, 3) == 3
        gray_for_entropy = rgb2gray(img);
    else
        gray_for_entropy = img;
    end
    entropy_val = entropy(gray_for_entropy);
    entropy_str = sprintf('%.2f', entropy_val);

    % 初始化显示标记
    has_psnr_ctrl = isfield(handles, 'text_psnr');
    has_ssim_ctrl = isfield(handles, 'text_ssim');
    has_entropy_ctrl = isfield(handles, 'text_entropy');
    has_time_ctrl = isfield(handles, 'text_time');

    % 更新通用指标控件 (Entropy & Time)
    if has_entropy_ctrl, set(handles.text_entropy, 'String', entropy_str); end
    if has_time_ctrl, set(handles.text_time, 'String', time_str); end

    try
        ref_img = handles.source_img; % 原始参考图
        res_img = img;                % 处理后结果图
        
        % 预处理：维度匹配
        if size(ref_img, 3) == 3 && size(res_img, 3) == 1
            ref_metric = rgb2gray(ref_img);
        else
            ref_metric = ref_img;
        end
        
        % 检查尺寸是否一致 (用于 PSNR/SSIM)
        if isequal(size(ref_metric), size(res_img))
            % 计算指标
            p_val = psnr(res_img, ref_metric);
            s_val = ssim(res_img, ref_metric);
            
            p_str = sprintf('%.2f dB', p_val);
            s_str = sprintf('%.4f', s_val);
            
            % 更新 PSNR/SSIM 控件
            if has_psnr_ctrl, set(handles.text_psnr, 'String', p_str); end
            if has_ssim_ctrl, set(handles.text_ssim, 'String', s_str); end
            
            % 用户明确要求不在图像标题显示结果
            title(handles.axes2, ''); 
        else
            % 尺寸不一致
            if has_psnr_ctrl, set(handles.text_psnr, 'String', 'N/A'); end
            if has_ssim_ctrl, set(handles.text_ssim, 'String', 'N/A'); end
            
            % 用户明确要求不在图像标题显示结果
            title(handles.axes2, '');
        end
    catch e
        disp(['计算指标出错: ' e.message]);
        title(handles.axes2, '');
    end
end


% --- Executes on button press in checkbox_he.
function checkbox_he_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_he (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_he
end

% --- Executes on button press in checkbox_clahe.
function checkbox_clahe_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_clahe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_clahe
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
    % 检查是否加载了图像
    if ~isfield(handles, 'source_img')
        msgbox('请先加载图像！', '提示', 'warn');
        return;
    end
    
    img = handles.source_img;
    
    % 转换为灰度图进行处理 (直方图处理通常针对灰度或亮度通道)
    if size(img, 3) == 3
        gray_img = rgb2gray(img);
    else
        gray_img = img;
    end
    
    % --- 1. 直方图均衡化 ---
    % 使用已有的 histogramEqualization 函数
    eq_img = histogramEqualization(gray_img);
    
    % --- 2. 直方图规定化 (匹配) ---
    % 弹出文件选择框，选择参考图像
    [filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Image Files (*.jpg, *.png, *.bmp, *.tif)'}, '选择参考图像 (直方图模板)');
    
    if isequal(filename, 0)
        % 用户取消选择，仅显示均衡化结果
        ref_img_gray = [];
        match_img = [];
    else
        ref_img_path = fullfile(pathname, filename);
        ref_img = imread(ref_img_path);
        
        % 转换为灰度图
        if size(ref_img, 3) == 3
            ref_img_gray = rgb2gray(ref_img);
        else
            ref_img_gray = ref_img;
        end
        
        % 计算参考图像的直方图
        target_hist = imhist(ref_img_gray);
        
        % 调用 histogramMatching 函数
        match_img = histogramMatching(gray_img, target_hist'); % 注意转置为行向量或保持列向量，视函数实现而定
        % 检查 histogramMatching 实现，它接收 1x256 或 256x1 均可，imhist 返回 256x1
    end
    
    % --- 3. 弹出窗口显示结果 ---
    % 动态调整窗口大小和子图数量
    if ~isempty(match_img)
        figure('Name', '直方图分析 (含匹配)', 'NumberTitle', 'off', 'Color', 'white', 'Position', [100, 100, 1200, 600]);
        cols = 4; % 4列：原图 | 均衡化 | 参考图 | 匹配后
    else
        figure('Name', '直方图分析', 'NumberTitle', 'off', 'Color', 'white', 'Position', [200, 200, 800, 400]);
        cols = 2; % 2列：原图 | 均衡化
    end
    
    % 1. 原始直方图
    subplot(2, cols, 1);
    imshow(gray_img);
    title('原始图像');
    
    subplot(2, cols, 1 + cols);
    [counts1, x1] = imhist(gray_img);
    bar(x1, counts1 / numel(gray_img), 'BarWidth', 1);
    xlim([0 255]);
    title('原始直方图');
    grid on;
    xlabel('Pixel Value'); ylabel('Frequency');
    
    % 2. 均衡化直方图
    subplot(2, cols, 2);
    imshow(eq_img);
    title('均衡化结果');
    
    subplot(2, cols, 2 + cols);
    [counts2, x2] = imhist(eq_img);
    bar(x2, counts2 / numel(eq_img), 'BarWidth', 1);
    xlim([0 255]);
    title('均衡化直方图');
    grid on;
    xlabel('Pixel Value'); ylabel('Frequency');
    
    if ~isempty(match_img)
        % 3. 参考图像直方图
        subplot(2, cols, 3);
        imshow(ref_img_gray);
        title('参考图像 (模板)');
        
        subplot(2, cols, 3 + cols);
        [counts_ref, x_ref] = imhist(ref_img_gray);
        bar(x_ref, counts_ref / numel(ref_img_gray), 'BarWidth', 1); % 默认蓝色
        xlim([0 255]);
        title('参考直方图');
        grid on;
        xlabel('Pixel Value'); ylabel('Frequency');
        
        % 4. 规定化直方图
        subplot(2, cols, 4);
        imshow(match_img);
        title('直方图匹配结果');
        
        subplot(2, cols, 4 + cols);
        [counts3, x3] = imhist(match_img);
        bar(x3, counts3 / numel(match_img), 'BarWidth', 1); % 默认蓝色
        xlim([0 255]);
        title('匹配后直方图 ');
        grid on;
        xlabel('Pixel Value'); ylabel('Frequency');
    end
end
