function varargout = DataGUI(varargin)
% DATAGUI M-file for DataGUI.fig
%      DATAGUI, by itself, creates a new DATAGUI or raises the existing
%      singleton*.
%
%      H = DATAGUI returns the handle to a new DATAGUI or the handle to
%      the existing singleton*.
%
%      DATAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATAGUI.M with the given input arguments.
%
%      DATAGUI('Property','Value',...) creates a new DATAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataGUI

% Last Modified by GUIDE v2.5 26-Aug-2012 10:56:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DataGUI_OutputFcn, ...
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


% --- Executes just before DataGUI is made visible.
function DataGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataGUI (see VARARGIN)

% Choose default command line output for DataGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function Num2_Callback(hObject, eventdata, handles)
% hObject    handle to Num2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Num2 as text
%        str2double(get(hObject,'String')) returns contents of Num2 as a double


% --- Executes during object creation, after setting all properties.
function Num2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in selectFile.
function selectFile_Callback(hObject, eventdata, handles)
% hObject    handle to selectFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chosen;

zoom out
set(handles.sliderGraph, 'Enable','Off')
set(handles.histogramPrint, 'Enable','Off')

fileData = get(handles.fileName,'String');
set(handles.errorMessage, 'String','')

%Take in the name of the file

fileName = get(handles.realFile, 'String');

% Check format of name of file
if ~(isempty(strfind(lower(fileData), ''))&& isempty(strfind(lower(fileData), '')))
    set(handles.errorMessage, 'String','Error: File should contain word log or lof.')
else
    
    %Read in the data
    fh = fopen(fileName, 'r');
    if fh == -1
        set(handles.errorMessage, 'String','Error: Provide Valid File Name.')
    elseif (str2num(get(handles.strFreq,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Sampling Frequency should be over 0.')
    else
        ln = fgets(fh);
        %ln = fgets(fh);
        %parts = regexp(ln,'-','split')
        %date = [sprintf('%02d',str2double(parts{1})),':', sprintf('%02d',str2double(parts{2})),':', sprintf('%02d',str2double(parts{3})),'   ', parts{length(parts)-2},'-',parts{length(parts)-1},'-',parts{length(parts)}];
        %Put Date
        set(handles.testDate,'String',ln);
        %Read in data
        dataCollected = importdata(fileName)
        data = dataCollected.data;
     
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Find the Columns with the data
        
        Pitch = 2;
        Yaw = 1;
        Roll = 3;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %Get Frequency
        Freq = str2num(get(handles.strFreq,'String'));
        
        %Get Data from text file
        VPitch = data(:,Pitch);
        VYaw = data(:,Yaw);
             
        %Pitch
        AngVelPitch = VPitch*(.0175);
        RotVelPitch= AngVelPitch/360;

        %Yaw
        AngVelYaw = VYaw*(.0175);
        RotVelYaw = AngVelYaw/360;
            
        [rowTime colTime] = size(data);
        TimeInc = linspace(0, 1/Freq*rowTime, rowTime);
        TimeInc = TimeInc';
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        numsDesired = get(handles.dataSelect,'Value');

        %Filter Data
        SamplingFreq = 1/(TimeInc(2)-TimeInc(1));
        cutFreq = SamplingFreq/6;
        Wn = 2*cutFreq/SamplingFreq;

        %Averaging Data
        numAvg = 10;
        if Wn >= 1
            set(handles.errorMessage, 'String','Error: Frequency has to be less than 1/2 Sampling Frequency.')
        elseif cutFreq<=0        
            set(handles.errorMessage, 'String','Error: Frequency has to be positive number.')
        elseif numAvg<=0 || mod(numAvg,1)~=0
            set(handles.errorMessage, 'String','Error: Number for Running Average has to be Positive Integer.')
        else
        
        %Create Filters
        [num,den] = butter(20,Wn,'low');
        filterAvg = ones(1,numAvg)/numAvg;
        
        AngVelRoll = data(:,Roll)*(.0175);
        initialRoll = mean(AngVelRoll);
        for i=100:(length(AngVelYaw)) 
            AngVelYaw(i) = AngVelYaw(i) - (mean(AngVelRoll((i-100+1):(i)))-initialRoll);
        end
        
        for i=100:(length(AngVelPitch)) 
            AngVelPitch(i) = AngVelPitch(i) - (mean(AngVelRoll((i-100+1):(i)))-initialRoll);
        end
        
        chosen = numsDesired;
        %Create Chart
            if numsDesired > 10
                set(handles.errorMessage, 'String','Error: Enter a Valid "Graph Desired"')
            else            
                if numsDesired == 1
                    Position = cumtrapz(TimeInc, AngVelYaw);
                    filteredData = filter(num,den, Position);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc, filteredData)
                    title('Angular Position Yaw');
                    xlabel('Time(s)');
                    ylabel('Angular Position (Degrees)');
                    zoom on
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                end
                if numsDesired == 2
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc, filteredData)
                    title('Angular Velocity Yaw');
                    xlabel('Time(s)');
                    ylabel('Angular Velocity (degrees/s)');
                    zoom on
                end
                if numsDesired == 3
                    Acc = diff(AngVelYaw)./diff(TimeInc);
                    filteredData = filter(num,den, Acc);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc(2:end), filteredData)
                    title('Angular Acceleration Yaw');
                    xlabel('Time(s)');
                    ylabel('Angular Acceleration (degrees/s/s)');
                    zoom on
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                end
                
                if numsDesired == 4
                    Position = cumtrapz(TimeInc, AngVelPitch);
                    filteredData = filter(num,den, Position);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc, filteredData)
                    title('Angular Position Pitch');
                    xlabel('Time(s)');
                    ylabel('Angular Position (Degrees)');
                    zoom on
                    filteredData = filter(num,den, AngVelPitch);
                    filteredData = filter(filterAvg, 1, filteredData)
                end             
                if numsDesired == 5
                    filteredData = filter(num,den, AngVelPitch);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc, filteredData)
                    title('Angular Velocity Pitch');
                    xlabel('Time(s)');
                    ylabel('Angular Velocity (degrees/s)');
                    zoom on
                end
                if numsDesired == 6
                    Acc = diff(AngVelPitch)./diff(TimeInc);
                    filteredData = filter(num,den, Acc);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc(2:end), filteredData)
                    title('Angular Acceleration Pitch');
                    xlabel('Time(s)');
                    ylabel('Angular Acceleration (degrees/s/s)');
                    zoom on
                    filteredData = filter(num,den, AngVelPitch);
                    filteredData = filter(filterAvg, 1, filteredData)
                end
                if numsDesired == 7
                    Position = cumtrapz(TimeInc, AngVelYaw);
                    filteredData1 = filter(num,den, Position);
                    filteredData1 = filter(filterAvg, 1, filteredData1);
                    filteredData2 = filter(num,den, AngVelYaw);
                    filteredData2 = filter(filterAvg, 1, filteredData2);
                    powerData = [filteredData1, filteredData2];
                    powerData = sort(powerData);
                    
                    [r junk] = size(powerData);
                    powerDataFix  = powerData(1,:);
                    fixind = 1;
                    fixsum = 1;
            
                    for i = 2:r
                        if powerData(i,1) == powerDataFix(fixind,1)
                            powerDataFix(fixind, 2) = powerDataFix(fixind, 2)*fixsum + powerData(i,2);
                            fixsum = fixsum+1;
                            powerDataFix(fixind, 2) = powerDataFix(fixind, 2)/fixsum;
                        else
                            fixsum = 1;
                            fixind = fixind+1;
                            powerDataFix(fixind,:) = powerData(i, :);
                        end
                    end
                    
                    plot(handles.graphData,powerDataFix(:,1), powerDataFix(:,2));
                    title('Power Yaw');
                    xlabel('Angular Position (Degrees)');
                    ylabel('Power');   
                    zoom on
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                end
                 if numsDesired == 8
                    Position = cumtrapz(TimeInc, AngVelPitch);
                    filteredData1 = filter(num,den, Position);
                    filteredData1 = filter(filterAvg, 1, filteredData1);
                    filteredData2 = filter(num,den, AngVelPitch);
                    filteredData2 = filter(filterAvg, 1, filteredData2);
                    powerData = [filteredData1, filteredData2];
                    powerData = sort(powerData);
                    
                    [r junk] = size(powerData);
                    powerDataFix  = powerData(1,:);
                    fixind = 1;
                    fixsum = 1;
            
                    for i = 2:r
                        if powerData(i,1) == powerDataFix(fixind,1)
                            powerDataFix(fixind, 2) = powerDataFix(fixind, 2)*fixsum + powerData(i,2);
                            fixsum = fixsum+1;
                            powerDataFix(fixind, 2) = powerDataFix(fixind, 2)/fixsum;
                        else
                            fixsum = 1;
                            fixind = fixind+1;
                            powerDataFix(fixind,:) = powerData(i, :);
                        end
                    end
                    plot(handles.graphData,powerDataFix(:,1), powerDataFix(:,2));
                    title('Power Pitch');
                    xlabel('Angular Position (Degrees)');
                    ylabel('Power');   
                    zoom on
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                 end
                
                 if numsDesired == 9
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                    
                    lengthFFT = length(filteredData);
                    filteredfft = fft(filteredData, lengthFFT);
                    Pfilteredfft = filteredfft.*conj(filteredfft)/lengthFFT;
                    f = Freq/lengthFFT*(0:(floor(lengthFFT/2)-1));
                    
                    plot(handles.graphData, f, Pfilteredfft(1:floor(lengthFFT/2)))
                    title('Power Spectral Density');
                    xlabel('Frequency (Hz)');
                    ylabel('Power (db)');
                    zoom on
                 end
                if numsDesired == 10
                    filteredData = filter(num,den, AngVelPitch);
                    filteredData = filter(filterAvg, 1, filteredData);
                    
                    lengthFFT = length(filteredData);
                    filteredfft = fft(filteredData, lengthFFT);
                    Pfilteredfft = filteredfft.*conj(filteredfft)/lengthFFT;
                    f = Freq/lengthFFT*(0:(floor(lengthFFT/2)-1));
                    
                    plot(handles.graphData, f, Pfilteredfft(1:floor(lengthFFT/2)))
                    title('Power Spectral Density');
                    xlabel('Frequency (Hz)');
                    ylabel('Power (db)');
                    zoom on
                end
                
                 
                graphEdge = get(handles.graphData,'xlim');
                scrollTimeNew = graphEdge(2)- graphEdge(1);
                set(handles.scrollTime, 'String',scrollTimeNew);
                
                [number location] = max(filteredData);
                
                speedMax = sprintf('%g degrees/s', number);
                timeMax = sprintf('%g seconds', TimeInc(location));
                avgVelocity=sprintf('%g degrees/s', mean(abs(filteredData)));
                
                set(handles.AvgVelData,'String',avgVelocity )
                set(handles.MaxVelData,'String', speedMax)
                set(handles.MaxTimeData,'String', timeMax)
            end
        end
    end
end

function fileName_Callback(hObject, eventdata, handles)
% hObject    handle to fileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileName as text
%        str2double(get(hObject,'String')) returns contents of fileName as a double


% --- Executes during object creation, after setting all properties.
function fileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in dataSelect.
function dataSelect_Callback(hObject, eventdata, handles)
% hObject    handle to dataSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns dataSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dataSelect


% --- Executes during object creation, after setting all properties.
function dataSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in dataSelect.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to dataSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hints: contents = get(hObject,'String') returns dataSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dataSelect


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to rest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom out;
set(handles.sliderGraph, 'Enable','Off')
set(handles.histogramPrint, 'Enable','Off')




% --- Executes on button press in filterAdd.
function filterAdd_Callback(hObject, eventdata, handles)
% hObject    handle to filterAdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chosen;

zoom out
set(handles.sliderGraph, 'Enable','Off')
set(handles.histogramPrint, 'Enable','Off')

fileData = get(handles.fileName,'String');
set(handles.errorMessage, 'String','')

%Take in the name of the file

fileName = get(handles.realFile, 'String');

% Check format of name of file
if ~(isempty(strfind(lower(fileData), ''))&& isempty(strfind(lower(fileData), '')))
    set(handles.errorMessage, 'String','Error: File should contain word log or lof.')
else
    
    %Read in the data
    fh = fopen(fileName, 'r');
    if fh == -1
        set(handles.errorMessage, 'String','Error: Provide Valid File Name.')
    elseif (str2num(get(handles.strFreq,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Sampling Frequency should be over 0.')
    else
        ln = fgets(fh);
        %ln = fgets(fh);
        %parts = regexp(ln,'-','split')
        %date = [sprintf('%02d',str2double(parts{1})),':', sprintf('%02d',str2double(parts{2})),':', sprintf('%02d',str2double(parts{3})),'   ', parts{length(parts)-2},'-',parts{length(parts)-1},'-',parts{length(parts)}];
        %Put Date
        set(handles.testDate,'String',ln);
        %Read in data
        dataCollected = importdata(fileName);
        data = dataCollected.data;
     
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Find the Columns with the data
        
        Pitch = 2;
        Yaw = 1;
        Roll = 3;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %Get Frequency
        Freq = str2num(get(handles.strFreq,'String'));
        
        %Get Data from text file
        VPitch = data(:,Pitch);
        VYaw = data(:,Yaw);
             
        %Pitch
        AngVelPitch = VPitch*(.0175);
        RotVelPitch= AngVelPitch/360;

        %Yaw
        AngVelYaw = VYaw*(.0175);
        RotVelYaw = AngVelYaw/360;
            
        [rowTime colTime] = size(data);
        TimeInc = linspace(0, 1/Freq*rowTime, rowTime);
        TimeInc = TimeInc';
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        numsDesired = get(handles.dataSelect,'Value');

        %Filter Data
        cutFreq = str2num(get(handles.cutFreq,'String'));
        SamplingFreq = 1/(TimeInc(2)-TimeInc(1));
        Wn = 2*cutFreq/SamplingFreq;

        %Averaging Data
        numAvg = str2num(get(handles.runAvgData,'String'));
        if Wn >= 1
            set(handles.errorMessage, 'String','Error: Frequency has to be less than 1/2 Sampling Frequency.')
        elseif cutFreq<=0        
            set(handles.errorMessage, 'String','Error: Frequency has to be positive number.')
        elseif numAvg<=0 || mod(numAvg,1)~=0
            set(handles.errorMessage, 'String','Error: Number for Running Average has to be Positive Integer.')
        else
        
        %Create Filters
        [num,den] = butter(20,Wn,'low');
        filterAvg = ones(1,numAvg)/numAvg;

            
        AngVelRoll = data(:,Roll)*(.0175);
        initialRoll = mean(AngVelRoll);
        for i=100:(length(AngVelYaw)) 
            AngVelYaw(i) = AngVelYaw(i) - (mean(AngVelRoll((i-100+1):(i)))-initialRoll);
        end
        
        for i=100:(length(AngVelPitch)) 
            AngVelPitch(i) = AngVelPitch(i) - (mean(AngVelRoll((i-100+1):(i)))-initialRoll);
        end
        
        
            chosen = numsDesired;
            
        %Create Chart
            if numsDesired > 10 
                set(handles.errorMessage, 'String','Error: Enter a Valid "Graph Desired"')
            else            
                if numsDesired == 1
                    Position = cumtrapz(TimeInc, AngVelYaw);
                    filteredData = filter(num,den, Position);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc, filteredData)
                    title('Angular Position Yaw');
                    xlabel('Time(s)');
                    ylabel('Angular Position (Degrees)');
                    zoom on
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                end
                if numsDesired == 2
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc, filteredData)
                    title('Angular Velocity Yaw');
                    xlabel('Time(s)');
                    ylabel('Angular Velocity (degrees/s)');
                    zoom on
                end
                if numsDesired == 3
                    Acc = diff(AngVelYaw)./diff(TimeInc);
                    filteredData = filter(num,den, Acc);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc(2:end), filteredData)
                    title('Angular Acceleration Yaw');
                    xlabel('Time(s)');
                    ylabel('Angular Acceleration (degrees/s/s)');
                    zoom on
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                end
                
                if numsDesired == 4
                    Position = cumtrapz(TimeInc, AngVelPitch);
                    filteredData = filter(num,den, Position);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc, filteredData)
                    title('Angular Position Pitch');
                    xlabel('Time(s)');
                    ylabel('Angular Position (Degrees)');
                    zoom on
                    filteredData = filter(num,den, AngVelPitch);
                    filteredData = filter(filterAvg, 1, filteredData)
                end             
                if numsDesired == 5
                    filteredData = filter(num,den, AngVelPitch);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc, filteredData)
                    title('Angular Velocity Pitch');
                    xlabel('Time(s)');
                    ylabel('Angular Velocity (degrees/s)');
                    zoom on
                end
                if numsDesired == 6
                    Acc = diff(AngVelPitch)./diff(TimeInc);
                    filteredData = filter(num,den, Acc);
                    filteredData = filter(filterAvg, 1, filteredData);
                    plot(handles.graphData, TimeInc(2:end), filteredData)
                    title('Angular Acceleration Pitch');
                    xlabel('Time(s)');
                    ylabel('Angular Acceleration (degrees/s/s)');
                    zoom on
                    filteredData = filter(num,den, AngVelPitch);
                    filteredData = filter(filterAvg, 1, filteredData)
                end
                if numsDesired == 7
                    Position = cumtrapz(TimeInc, AngVelYaw);
                    filteredData1 = filter(num,den, Position);
                    filteredData1 = filter(filterAvg, 1, filteredData1);
                    filteredData2 = filter(num,den, AngVelYaw);
                    filteredData2 = filter(filterAvg, 1, filteredData2);
                    powerData = [filteredData1, filteredData2];
                    powerData = sort(powerData);
                    
                    [r junk] = size(powerData);
                    powerDataFix  = powerData(1,:);
                    fixind = 1;
                    fixsum = 1;
            
                    for i = 2:r
                        if powerData(i,1) == powerDataFix(fixind,1)
                            powerDataFix(fixind, 2) = powerDataFix(fixind, 2)*fixsum + powerData(i,2);
                            fixsum = fixsum+1;
                            powerDataFix(fixind, 2) = powerDataFix(fixind, 2)/fixsum;
                        else
                            fixsum = 1;
                            fixind = fixind+1;
                            powerDataFix(fixind,:) = powerData(i, :);
                        end
                    end
                    
                    plot(powerDataFix(:,1), powerDataFix(:,2));
                    title('Power Yaw');
                    xlabel('Angular Position (Degrees)');
                    ylabel('Power');   
                    zoom on
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                end
                if numsDesired == 8
                    Position = cumtrapz(TimeInc, AngVelPitch);
                    filteredData1 = filter(num,den, Position);
                    filteredData1 = filter(filterAvg, 1, filteredData1);
                    filteredData2 = filter(num,den, AngVelPitch);
                    filteredData2 = filter(filterAvg, 1, filteredData2);
                    powerData = [filteredData1, filteredData2];
                    powerData = sort(powerData);
                    
                    [r junk] = size(powerData);
                    powerDataFix  = powerData(1,:);
                    fixind = 1;
                    fixsum = 1;
            
                    for i = 2:r
                        if powerData(i,1) == powerDataFix(fixind,1)
                            powerDataFix(fixind, 2) = powerDataFix(fixind, 2)*fixsum + powerData(i,2);
                            fixsum = fixsum+1;
                            powerDataFix(fixind, 2) = powerDataFix(fixind, 2)/fixsum;
                        else
                            fixsum = 1;
                            fixind = fixind+1;
                            powerDataFix(fixind,:) = powerData(i, :);
                        end
                    end
                    plot(powerDataFix(:,1), powerDataFix(:,2));
                    title('Power Pitch');
                    xlabel('Angular Position (Degrees)');
                    ylabel('Power');   
                    zoom on
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                end
                
                if numsDesired == 9
                    filteredData = filter(num,den, AngVelYaw);
                    filteredData = filter(filterAvg, 1, filteredData);
                    
                    lengthFFT = length(filteredData);
                    filteredfft = fft(filteredData, lengthFFT);
                    Pfilteredfft = filteredfft.*conj(filteredfft)/lengthFFT;
                    f = Freq/lengthFFT*(0:(floor(lengthFFT/2)-1));
                    
                    plot(handles.graphData, f, Pfilteredfft(1:floor(lengthFFT/2)))
                    title('Power Spectral Density');
                    xlabel('Frequency (Hz)');
                    ylabel('Power (db)');
                    zoom on
                 end
                if numsDesired == 10
                    filteredData = filter(num,den, AngVelPitch);
                    filteredData = filter(filterAvg, 1, filteredData);
                    
                    lengthFFT = length(filteredData);
                    filteredfft = fft(filteredData, lengthFFT);
                    Pfilteredfft = filteredfft.*conj(filteredfft)/lengthFFT;
                    f = Freq/lengthFFT*(0:(floor(lengthFFT/2)-1));
                    
                    plot(handles.graphData, f, Pfilteredfft(1:floor(lengthFFT/2)))
                    title('Power Spectral Density');
                    xlabel('Frequency (Hz)');
                    ylabel('Power (db)');
                    zoom on
                end
                
                graphEdge = get(handles.graphData,'xlim');
                scrollTimeNew = graphEdge(2)- graphEdge(1);
                set(handles.scrollTime, 'String',scrollTimeNew);
                
                
                [number location] = max(filteredData);
                
                speedMax = sprintf('%g degrees/s', number);
                timeMax = sprintf('%g seconds', TimeInc(location));
                avgVelocity=sprintf('%g degrees/s', mean(abs(filteredData)));
                
                set(handles.AvgVelData,'String',avgVelocity )
                set(handles.MaxVelData,'String', speedMax)
                set(handles.MaxTimeData,'String', timeMax)
            end
        end
    end
end

function cutFreq_Callback(hObject, eventdata, handles)
% hObject    handle to cutFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutFreq as text
%        str2double(get(hObject,'String')) returns contents of cutFreq as a double


% --- Executes during object creation, after setting all properties.
function cutFreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function runAvgData_Callback(hObject, eventdata, handles)
% hObject    handle to runAvgData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of runAvgData as text
%        str2double(get(hObject,'String')) returns contents of runAvgData as a double


% --- Executes during object creation, after setting all properties.
function runAvgData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to runAvgData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strFreq_Callback(hObject, eventdata, handles)
% hObject    handle to strFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strFreq as text
%        str2double(get(hObject,'String')) returns contents of strFreq as a double


% --- Executes during object creation, after setting all properties.
function strFreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in printGraph.
function printGraph_Callback(hObject, eventdata, handles)
% hObject    handle to printGraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
orient landscape
 set(gcf,'PaperPositionMode', 'manual', ...
 'PaperUnits','centimeters', ...
 'Paperposition',[1 1 28.7 20])
print;


% --- Executes on slider movement.
function sliderGraph_Callback(hObject, eventdata, handles)
% hObject    handle to sliderGraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    
    if (str2num(get(handles.strFreq,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Sampling Frequency should be over 0.')
    elseif (str2num(get(handles.scrollTime,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Time Increment should be over 0.')
    else
        minTime = min(get(get(gca,'Children'),'xdata'));
        maxTime = max(get(get(gca,'Children'),'xdata'));
        sliderValue = get(handles.sliderGraph,'Value');
        scrollTimeInc=str2num(get(handles.scrollTime,'String'));
        

        me=minTime + (maxTime - minTime-scrollTimeInc)*sliderValue;
        set(handles.graphData,'xlim', [me (me+scrollTimeInc)]);
        
    end
% end

% --- Executes during object creation, after setting all properties.
function sliderGraph_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderGraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in graphZoom.
function graphZoom_Callback(hObject, eventdata, handles)
% hObject    handle to graphZoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)       
global chosen;

    if (str2num(get(handles.strFreq,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Sampling Frequency should be over 0.')
    elseif (str2num(get(handles.scrollTime,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Time Increment should be over 0.')
    else
        [c r]= size(get(get(gca,'Children'),'xdata'));
        maxTime = max(get(get(gca,'Children'),'xdata'));
        minTime = min(get(get(gca,'Children'),'xdata'));
        
        graphEdge = get(handles.graphData,'xlim');
        scrollTimeNew = graphEdge(2)- graphEdge(1);
        set(handles.scrollTime, 'String',scrollTimeNew);
        
        scrollTimeInc=str2num(get(handles.scrollTime,'String'));
        
        if graphEdge(1)<minTime
            set(handles.graphData,'xlim', [minTime (minTime+scrollTimeInc)]);
        end
        if graphEdge(2)>maxTime
            set(handles.graphData,'xlim', [(maxTime-scrollTimeInc) maxTime]);
        end
        graphEdge = get(handles.graphData,'xlim');
        
        timeZoom = maxTime - minTime;
        rSmall = (timeZoom-scrollTimeInc);
                
        newSlider=(graphEdge(1) - minTime)/rSmall;
        set(handles.sliderGraph, 'Value',newSlider);

        me=newSlider*(rSmall)+minTime;
        set(handles.graphData,'xlim', [me (me+scrollTimeInc)]);
    end
    
   set(handles.sliderGraph, 'Enable','On')
   set(handles.histogramPrint, 'Enable','On')




function scrollTime_Callback(hObject, eventdata, handles)
% hObject    handle to scrollTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scrollTime as text
%        str2double(get(hObject,'String')) returns contents of scrollTime as a double


    if (str2num(get(handles.strFreq,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Sampling Frequency should be over 0.')
    elseif (str2num(get(handles.scrollTime,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Time Increment should be over 0.')
    else
        [c r]= size(get(get(gca,'Children'),'xdata'));
        maxTime = max(get(get(gca,'Children'),'xdata'));
        minTime = min(get(get(gca,'Children'),'xdata'));
        sliderValue = get(handles.sliderGraph, 'Value');
        
        scrollTimeInc=str2num(get(handles.scrollTime,'String'));
        
        timeZoom = maxTime - minTime;
        rSmall = (timeZoom-scrollTimeInc);
             
        timeLow = minTime + rSmall*sliderValue;
        set(handles.graphData,'xlim', [timeLow (timeLow+scrollTimeInc)]);
    end


% --- Executes during object creation, after setting all properties.
function scrollTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scrollTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in histogramPrint.
function histogramPrint_Callback(hObject, eventdata, handles)
% hObject    handle to histogramPrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        

    if (str2num(get(handles.strFreq,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Sampling Frequency should be over 0.')
    elseif (str2num(get(handles.scrollTime,'String'))>0)==0
        set(handles.errorMessage, 'String','Error: Time Increment should be over 0.')
    else
        %Figure value of slider
        [c r]= size(get(get(gca,'Children'),'xdata'));
        maxTime = max(get(get(gca,'Children'),'xdata'));
        minTime = min(get(get(gca,'Children'),'xdata'));
        
        sliderValue = get(handles.sliderGraph, 'Value');
        scrollTimeInc=str2num(get(handles.scrollTime,'String'));
       

        me=minTime + sliderValue*(maxTime - minTime -scrollTimeInc);
  
        low = 1;
        high = 1;

        x=get(get(gca,'Children'),'xdata');
        y=get(get(gca,'Children'),'ydata');
        %Figure upper and lower time
        for i=1:length(x)
            if abs(x(i)- me) <0.1
                low = i;
            end
            if abs(x(i)-(me+scrollTimeInc)) <0.1
                high = i;
            end    
        end
        if high == 1
            high = length(x);
        end
        figure;
        %Print histogram
        hist(y(low:high));
        title('Histogram of Data');
        xlabel('Value');
        ylabel('Occurence of Value');
        
        %Calculate stats of data
        avgData = mean(y(low:high));
        stdData = std(y(low:high));
        
        valueData = sprintf('Average %s\nStandard Deviation = %s', num2str(avgData), num2str(stdData));
        
        
        %Standard Deviation and Average Display
        h = msgbox(valueData,'Values');
    end



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [FileName,PathName] = uigetfile('.txt');
    PathNameFileName = [PathName FileName];
    if ~isempty(FileName) && ~isa(FileName, 'double')
        set(handles.fileName, 'String',FileName);
        set(handles.realFile, 'String',PathNameFileName);
    end
    
