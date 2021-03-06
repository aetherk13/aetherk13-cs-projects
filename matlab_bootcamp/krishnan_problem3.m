function varargout = krishnan_problem3(varargin)
% KRISHNAN_PROBLEM3 MATLAB code for krishnan_problem3.fig
%      KRISHNAN_PROBLEM3, by itself, creates a new KRISHNAN_PROBLEM3 or raises the existing
%      singleton*.
%
%      H = KRISHNAN_PROBLEM3 returns the handle to a new KRISHNAN_PROBLEM3 or the handle to
%      the existing singleton*.
%
%      KRISHNAN_PROBLEM3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KRISHNAN_PROBLEM3.M with the given input arguments.
%
%      KRISHNAN_PROBLEM3('Property','Value',...) creates a new KRISHNAN_PROBLEM3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before krishnan_problem3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to krishnan_problem3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help krishnan_problem3

% Last Modified by GUIDE v2.5 24-Feb-2022 22:42:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @krishnan_problem3_OpeningFcn, ...
                   'gui_OutputFcn',  @krishnan_problem3_OutputFcn, ...
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


% --- Executes just before krishnan_problem3 is made visible.
function krishnan_problem3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to krishnan_problem3 (see VARARGIN)

% Choose default command line output for krishnan_problem3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes krishnan_problem3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = krishnan_problem3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in importRLE_button.
function importRLE_button_Callback(hObject, eventdata, handles)
% hObject    handle to importRLE_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.importRLE_button, 'gen0', getappdata(handles.RLE_text, 'gen0'));


function RLE_text_Callback(hObject, eventdata, handles)
% hObject    handle to RLE_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RLE_text as text
%        str2double(get(hObject,'String')) returns contents of RLE_text as a double
input_file = get(handles.RLE_text, 'String');
mat = RLE_decoder(input_file);
setappdata(handles.RLE_text, 'gen0', mat);

% --- Executes during object creation, after setting all properties.
function RLE_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RLE_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in randMatrix_button.
function randMatrix_button_Callback(hObject, eventdata, handles)
% hObject    handle to randMatrix_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in generations_popup.
function generations_popup_Callback(hObject, eventdata, handles)
% hObject    handle to generations_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns generations_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from generations_popup
str = get(handles.generations_popup, 'String');
val = get(handles.generations_popup,'Value');
max_gen = sscanf(str{val}, '%d');
setappdata(handles.generations_popup, 'max_gen', max_gen);

% --- Executes during object creation, after setting all properties.
function generations_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to generations_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in load_button.
function load_button_Callback(hObject, eventdata, handles)
% hObject    handle to load_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gen0= padarray(getappdata(handles.importRLE_button, 'gen0'), [1,1], 0, 'both');
setappdata(handles.load_button, 'gen0', gen0);
imagesc(handles.axes1, gen0);
colormap(gray);
cell_of_gens = {gen0};
setappdata(handles.load_button, 'cell_of_gens', cell_of_gens);
gen_num = 0;
setappdata(handles.load_button, 'gen_num', gen_num);

% --- Executes on button press in exportMovie_button.
function exportMovie_button_Callback(hObject, eventdata, handles)
% hObject    handle to exportMovie_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    prevGen = getappdata(handles.load_button, 'gen0');
    frame_rate = getappdata(handles.frameRate_popup, 'frame_rate');
    max_gen = getappdata(handles.generations_popup, 'max_gen');
    export_name = getappdata(handles.export_name, 'export_name');
    display(max_gen);
    v = VideoWriter(export_name);
    v.FrameRate = frame_rate;
    open(v);
    imagesc(handles.axes1, prevGen);
    colormap(gray);
    frame = getframe(handles.axes1);
    writeVideo(v, frame);
    for k=1:1:getappdata(handles.generations_popup, 'max_gen');
        prevGen = GOL(prevGen);
        imagesc(handles.axes1, prevGen);
        colormap(gray);
        frame = getframe(handles.axes1);
        writeVideo(v, frame);
    end
    close(v);

% --- Executes on button press in stepBack_button.
function stepBack_button_Callback(hObject, eventdata, handles)
% hObject    handle to stepBack_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cell_of_gens = getappdata(handles.load_button, 'cell_of_gens');
gen_num = getappdata(handles.load_button, 'gen_num');
if gen_num ~= 0
    gen_num = gen_num-1;
    imagesc(handles.axes1, cell_of_gens{gen_num+1});
    colormap(gray);
    setappdata(handles.load_button, 'gen_num', gen_num);
end

% --- Executes on button press in stepForward_button.
function stepForward_button_Callback(hObject, eventdata, handles)
% hObject    handle to stepForward_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cell_of_gens = getappdata(handles.load_button, 'cell_of_gens');
gen_num = getappdata(handles.load_button, 'gen_num');
gen_num = gen_num+1;
cell_of_gens{gen_num+1} = GOL(cell_of_gens{gen_num});
imagesc(handles.axes1, cell_of_gens{gen_num+1});
colormap(gray);
setappdata(handles.load_button, 'cell_of_gens', cell_of_gens);
setappdata(handles.load_button, 'gen_num', gen_num);

% --- Executes on button press in stop_radiobutton.
function stop_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to stop_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stop_radiobutton
stop_state = get(handles.stop_radiobutton, 'Value');
setappdata(handles.stop_radiobutton, 'stop_state', stop_state);


% --- Executes on button press in play_button.
function play_button_Callback(hObject, eventdata, handles)
% hObject    handle to play_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cell_of_gens = getappdata(handles.load_button, 'cell_of_gens');
gen_num = getappdata(handles.load_button, 'gen_num');
frame_rate = getappdata(handles.frameRate_popup, 'frame_rate');
while getappdata(handles.stop_radiobutton, 'stop_state')==0
    gen_num = gen_num+1;
    cell_of_gens{gen_num+1} = GOL(cell_of_gens{gen_num});
    imagesc(handles.axes1, cell_of_gens{gen_num+1});
    colormap(gray);
    pause(1 / frame_rate);
    setappdata(handles.load_button, 'cell_of_gens', cell_of_gens);
    setappdata(handles.load_button, 'gen_num', gen_num);
end


% --- Executes on selection change in frameRate_popup.
function frameRate_popup_Callback(hObject, eventdata, handles)
% hObject    handle to frameRate_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns frameRate_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from frameRate_popup
str = get(handles.frameRate_popup, 'String');
val = get(hObject,'Value');
frame_rate = sscanf(str{val},'%d');

setappdata(handles.frameRate_popup, 'frame_rate', frame_rate);

% --- Executes during object creation, after setting all properties.
function frameRate_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frameRate_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clear_button.
function clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 cla(handles.axes1,'reset');


% --- Executes on button press in exportFrame_button.
function exportFrame_button_Callback(hObject, eventdata, handles)
% hObject    handle to exportFrame_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
export_name = getappdata(handles.export_name, 'export_name');
exportgraphics(handles.axes1, export_name);

function export_name_Callback(hObject, eventdata, handles)
% hObject    handle to export_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of export_name as text
%        str2double(get(hObject,'String')) returns contents of export_name as a double
export_Name = get(handles.export_name, 'String');
setappdata(handles.export_name, 'export_name', export_name);


% --- Executes during object creation, after setting all properties.
function export_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to export_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
