clc;
close all;
clearvars;

load('data1.mat')
f1 = 2000; %Sampling frequency in Hz
t1 = (1:length(data1))/f1;
figure(1);
plot(t1,data1)
xlabel("time sampling [s]")
ylabel("EMG voltage[muV]")


%lowpass(x,150,fs)
load('data2.mat')
f2 = 166; %Sampling frequency in Hz
t2 = (1:length(data2))/f2;
figure(2);
hold on
plot(t2,data2(1,:))
plot(t2,data2(2,:))
cmag=sqrt(data2(1,:).^2+data2(2,:).^2);
plot(t2,cmag)
legend("x","y","magnitude")
xlabel("time sampling [s]")
ylabel('coordinate[cm]')
figure(3)
plot(data2(1,:),data2(2,:))
xlabel('x coordinate[cm]')
ylabel('y coordinate[cm]')

px=data2(1,:)-[0 data2(1,1:end-1)];
py=data2(2,:)-[0 data2(2,1:end-1)];
figure(4)
quiver(data2(1,:),data2(2,:),1000*px,1000*py)
xlabel('x coordinate[cm]')
ylabel('y coordinate[cm]')


load('data3.mat')
f3 = 250; %Sampling frequency in Hz
t3 = (1:length(data3))/f3;
figure(5)
plot(t3, data3)
xlabel("time sampling [s]")
ylabel("EEG voltage[muV]")




%% Spectral display
figure(6)
lowpass(data1,60,f1);
figure(7)
lowpass(data2(1,:),60,f2);
figure(8)
lowpass(data2(2,:),60,f2);
figure(9)
lowpass(cmag,60,f2);
figure(10)
lowpass(data3,10,f3);

figure(11)
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


figure
hold on
plot(t1,data1)
plot(t2*2,data2(1,:))
plot(t2*2,data2(2,:))

figure
lowpass(data3-mean(data3),150,f1);
