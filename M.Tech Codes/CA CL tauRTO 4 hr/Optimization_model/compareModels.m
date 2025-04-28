clc;clear;close all

%% plots
load Z18
Z18 = Z;
SNO1 = Z(:,1);
SO2 = Z(:,2);
SNH2 = Z(:,3);

load Z45
Z45 = Z;
SNO2 = Z(:,1);
SO5 = Z(:,2);
SNH5 = Z(:,3);

%% SNO1 vs time
figure
plot(SNO1)
hold on
plot(SNO2)
title('S_N_O')
legend('S_N_O_l_,_1_8', 'S_N_O_2_,_4_5')

