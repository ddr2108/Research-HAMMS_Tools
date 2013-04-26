function varargout = Poster(varargin)
% POSTER MATLAB code for Poster.fig
%      POSTER, by itself, creates a new POSTER or raises the existing
%      singleton*.
%
%      H = POSTER returns the handle to a new POSTER or the handle to
%      the existing singleton*.
%
%      POSTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POSTER.M with the given input arguments.
%
%      POSTER('Property','Value',...) creates a new POSTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Poster_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Poster_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Poster

% Last Modified by GUIDE v2.5 27-Oct-2012 15:56:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Poster_OpeningFcn, ...
                   'gui_OutputFcn',  @Poster_OutputFcn, ...
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


% --- Executes just before Poster is made visible.
function Poster_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Poster (see VARARGIN)

% Choose default command line output for Poster
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Poster wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Poster_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double


% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m1_Callback(hObject, eventdata, handles)
% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m1 as text
%        str2double(get(hObject,'String')) returns contents of m1 as a double


% --- Executes during object creation, after setting all properties.
function m1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1_Callback(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s1 as text
%        str2double(get(hObject,'String')) returns contents of s1 as a double


% --- Executes during object creation, after setting all properties.
function s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in post.
function post_Callback(hObject, eventdata, handles)
% hObject    handle to post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Get name
name = get(handles.name,'String');
day = sprintf('%02d',str2double(get(handles.day, 'String')));
month = sprintf('%02d',str2double(get(handles.month, 'String')));
year = sprintf('%04d',str2double(get(handles.year, 'String')));

if (isempty(name)||isempty(get(handles.day, 'String'))||isempty(get(handles.year, 'String'))||isempty(get(handles.month, 'String')))
     h = msgbox('Please Enter Patient Name and Date','Patient');
else
    %String to send
    total = '';

    %Get timings
    min1 = get(handles.m1, 'String');
    min2 = get(handles.m2, 'String');
    min3 = get(handles.m3, 'String');
    min4 = get(handles.m4, 'String');
    min5 = get(handles.m5, 'String');
    min6 = get(handles.m6, 'String');

    sec1 = sprintf('%02d',str2double(get(handles.s1, 'String')));
    sec2 = sprintf('%02d',str2double(get(handles.s2, 'String')));
    sec3 = sprintf('%02d',str2double(get(handles.s3, 'String')));
    sec4 = sprintf('%02d',str2double(get(handles.s4, 'String')));
    sec5 = sprintf('%02d',str2double(get(handles.s5, 'String')));
    sec6 = sprintf('%02d',str2double(get(handles.s6, 'String')));

    ex1 = get(handles.ex1, 'Value');
    ex2 = get(handles.ex2, 'Value');
    ex3 = get(handles.ex3, 'Value');
    ex4 = get(handles.ex4, 'Value');
    ex5 = get(handles.ex5, 'Value');
    ex6 = get(handles.ex6, 'Value');

    %Fix naming of exercise for patient
    if (ex1==1)
        actEx1 = 'horizontal';
    elseif (ex1==2)
        actEx1 = 'vertical';
    end
    if (ex2==1)
        actEx2 = 'horizontal';
    elseif (ex2==2)
        actEx2 = 'vertical';
    end
    if (ex3==1)
        actEx3 = 'horizontal';
    elseif (ex3==2)
        actEx3 = 'vertical';
    end
    if (ex4==1)
        actEx4 = 'horizontal';
    elseif (ex4==2)
        actEx4 = 'vertical';
    end
    if (ex5==1)
        actEx5 = 'horizontal';
    elseif (ex5==2)
        actEx5 = 'vertical';
    end
    if (ex6==1)
        actEx6 = 'horizontal';
    elseif (ex6==2)
        actEx6 = 'vertical';
    end

    %Generate String
    if (~(ex1==3)&&~isempty(min1))
        %total = strcat(total,);
        total = [min1, ':',sec1,'-',actEx1]; 
        if (~(ex2==3)&&~isempty(min2))
            total = [total char(10) min2, ':',sec2,'-',actEx2];
            if (~(ex3==3)&&~isempty(min3))
                total = [total char(10) min3, ':',sec3,'-',actEx3];
                if (~(ex4==3)&&~isempty(min4))
                    total = [total char(10) min4, ':',sec4,'-',actEx4];
                    if (~(ex5==3)&&~isempty(min5))
                        total = [total char(10) min5, ':',sec5,'-',actEx5];
                        if (~(ex6==3)&&~isempty(min6))
                            total = [total char(10) min6, ':',sec6,'-',actEx6];
                        end
                    end
                end
            end
        end
    end
    
    %Get to directory
    try
        f = ftp('deepdattaroy.com','deep','siddhartha');
        cd(f, 'Documents/Web/projects/HAMMS');
        mkdir(f, name);
        cd (f, name);
        mkdir(f, 'results');
        mkdir(f, 'exercises');
        cd(f, 'exercises');

        %Write data to file
        fid=fopen([month day year],'w' ); % i want to know other operands like 'w'
        fprintf(fid, total); % i want to know if there are other options to do
        fclose(fid);

        %Copy file to ftp server
        mput(f, [month day year]);
        close(f);
        filename = [month day year];
        cleanupObj = onCleanup(@()delete([month day year]));
        msgbox('Upload Successful','Success','none');
    catch err
        msgbox('Upload Failed: Could not Connect to Server','Error','error');
    end

    
end











% --- Executes on selection change in ex1.
function ex1_Callback(hObject, eventdata, handles)
% hObject    handle to ex1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ex1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ex1


% --- Executes during object creation, after setting all properties.
function ex1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m2_Callback(hObject, eventdata, handles)
% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m2 as text
%        str2double(get(hObject,'String')) returns contents of m2 as a double


% --- Executes during object creation, after setting all properties.
function m2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2_Callback(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2 as text
%        str2double(get(hObject,'String')) returns contents of s2 as a double


% --- Executes during object creation, after setting all properties.
function s2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ex2.
function ex2_Callback(hObject, eventdata, handles)
% hObject    handle to ex2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ex2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ex2


% --- Executes during object creation, after setting all properties.
function ex2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m3_Callback(hObject, eventdata, handles)
% hObject    handle to m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m3 as text
%        str2double(get(hObject,'String')) returns contents of m3 as a double


% --- Executes during object creation, after setting all properties.
function m3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3_Callback(hObject, eventdata, handles)
% hObject    handle to s3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s3 as text
%        str2double(get(hObject,'String')) returns contents of s3 as a double


% --- Executes during object creation, after setting all properties.
function s3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ex3.
function ex3_Callback(hObject, eventdata, handles)
% hObject    handle to ex3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ex3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ex3


% --- Executes during object creation, after setting all properties.
function ex3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m4_Callback(hObject, eventdata, handles)
% hObject    handle to m4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m4 as text
%        str2double(get(hObject,'String')) returns contents of m4 as a double


% --- Executes during object creation, after setting all properties.
function m4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4_Callback(hObject, eventdata, handles)
% hObject    handle to s4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s4 as text
%        str2double(get(hObject,'String')) returns contents of s4 as a double


% --- Executes during object creation, after setting all properties.
function s4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ex4.
function ex4_Callback(hObject, eventdata, handles)
% hObject    handle to ex4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ex4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ex4


% --- Executes during object creation, after setting all properties.
function ex4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m5_Callback(hObject, eventdata, handles)
% hObject    handle to m5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m5 as text
%        str2double(get(hObject,'String')) returns contents of m5 as a double


% --- Executes during object creation, after setting all properties.
function m5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5_Callback(hObject, eventdata, handles)
% hObject    handle to s5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s5 as text
%        str2double(get(hObject,'String')) returns contents of s5 as a double


% --- Executes during object creation, after setting all properties.
function s5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ex5.
function ex5_Callback(hObject, eventdata, handles)
% hObject    handle to ex5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ex5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ex5


% --- Executes during object creation, after setting all properties.
function ex5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m6_Callback(hObject, eventdata, handles)
% hObject    handle to m6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m6 as text
%        str2double(get(hObject,'String')) returns contents of m6 as a double


% --- Executes during object creation, after setting all properties.
function m6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s6_Callback(hObject, eventdata, handles)
% hObject    handle to s6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s6 as text
%        str2double(get(hObject,'String')) returns contents of s6 as a double


% --- Executes during object creation, after setting all properties.
function s6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ex6.
function ex6_Callback(hObject, eventdata, handles)
% hObject    handle to ex6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ex6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ex6


% --- Executes during object creation, after setting all properties.
function ex6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exNum_Callback(hObject, eventdata, handles)
% hObject    handle to exNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exNum as text
%        str2double(get(hObject,'String')) returns contents of exNum as a double


% --- Executes during object creation, after setting all properties.
function exNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function day_Callback(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of day as text
%        str2double(get(hObject,'String')) returns contents of day as a double


% --- Executes during object creation, after setting all properties.
function day_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function year_Callback(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of year as text
%        str2double(get(hObject,'String')) returns contents of year as a double


% --- Executes during object creation, after setting all properties.
function year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function month_Callback(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of month as text
%        str2double(get(hObject,'String')) returns contents of month as a double


% --- Executes during object creation, after setting all properties.
function month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
