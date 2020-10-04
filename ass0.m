clc;
close all;
clearvars;

%% Assignment 0 - Biomedical Engineering 2020
%
%   Group members:
%       Andres Arturo Gutierrez (S5091296)
%       Filip Hesse (S4889494)
%       Rohit Kumar (S5091296)
%       Matteo Palmas (S479803)

%% DATA1: EMG-DATA
%
%   - Periodic nature
%   - main frequency: ~40 Hz

load('data1.mat')

f1 = 2000; %Sampling frequency in Hz
t1 = (1:length(data1))/f1;

figure
lowpass(data1,60,f1);

%% DATA2: POSITION DATA

% SUBPLOT 1:
%
%   - X-Y-Distance to the reference system over time
%   - non periodic limited signal
%   - with 2 components

load('data2.mat')

f2 = 166; %Sampling frequency in Hz
t2 = (1:length(data2))/f2;

figure
subplot(2,2,1:2)
hold on
plot(t2,data2(1,:))
plot(t2,data2(2,:))
cmag=sqrt(data2(1,:).^2+data2(2,:).^2);
plot(t2,cmag)
legend("x","y","magnitude")
xlabel("time sampling [s]")
ylabel('coordinate[cm]')
title("Data2: X- and Y-Positions of the Arm (in time)")

% SUBPLOT 2:
%
%   - Positions of the end-effector in the x-y-plane

subplot(2,2,3)
plot(data2(1,:),data2(2,:))
xlabel('x coordinate[cm]')
ylabel('y coordinate[cm]')
title("Data2: X- and Y-Positions of the Arm (in space)")

% SUBPLOT 3:
%
%   - Angular orientation of the vector from the origin
%     to the human end-effector
%   => order of achieved end-points can be determined

subplot(2,2,4)
p=cmag>50;
hold on
plot(t2(p),atan2(data2(2,p),data2(1,p))*180/pi,'o')
plot(t2(p),-135*ones(1,size(t2(p),2)),'r')
plot(t2(p),-90*ones(1,size(t2(p),2)),'r')
plot(t2(p),-45*ones(1,size(t2(p),2)),'r')
plot(t2(p),0*ones(1,size(t2(p),2)),'r')
plot(t2(p),45*ones(1,size(t2(p),2)),'r')
plot(t2(p),90*ones(1,size(t2(p),2)),'r')
plot(t2(p),135*ones(1,size(t2(p),2)),'r')

xlabel('time[s]')
ylabel('angular position[deg]')
title("Data2: Final Angular Positions")


%% DATA3: EEG DATA
%
%   - Big constant component (DC-level)
%   - less periodic character
%   - main frequency: ~10 Hz (after deleting constant component)

load('data3.mat')

f3 = 250; %Sampling frequency in Hz
t3 = (1:length(data3))/f3;

figure
plot(t3, data3/1000)
xlabel("time sampling [s]")
ylabel("Voltage[muV]")
title("EEG-Data")

save_images();



