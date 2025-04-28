%% SNO1
y_SNOp1= cellflat(record_SNOp1_transient(1:end));
y_SNOp1= cell2mat(y_SNOp1);

figure
plot(x_tk, y_SNOp1)
ylabel('S_N_O_p_,_2 (g/m^3)')
xlabel('time (d)')
title('S_N_O_p_,_2 vs time')
yline(0.5,'r--', 'lower limit');
yline(5,'r--', 'upper limit');

ylim([0, 5])
grid on
% 
% model
% y_SO2= cellflat(record_SO2_transient(1:end));
% y_SO2= cell2mat(y_SO2);
% figure
% plot(x_tk, y_SO2)
% ylabel('S_N_O_,_2 (g/m^3)')
% xlabel('time (d)')
% title('S_N_O_,_2 vs time')
% grid on

% % hold on SNHp,5 SNH5
% figure
% plot(x_tk, y_SNOp1)
% hold on
% plot(x_tk, y_SO2)
% title('S_N_O_p_,_2, S_N_O_,_2 vs time')
% ylabel('S_O_O_p_,_2, S_N_O_,_2 (g/m^3)')
% xlabel('time (d)')
% legend('Plant', 'Model')
% grid on

%% SO2
y_SOp2= cellflat(record_SOp2_transient(1:end));
y_SOp2= cell2mat(y_SOp2);

figure
plot(x_tk, y_SOp2)
ylabel('S_O_p_,_5 (g/m^3)')
xlabel('time (d)')
title('S_O_p_,_5 vs time')
yline(0.5,'r--', 'lower limit');
yline(5,'r--', 'upper limit');
ylim([0, 5])
grid on

% % model
% y_SO2= cellflat(record_SO2_transient(1:end));
% y_SO2= cell2mat(y_SO2);
% figure
% plot(x_tk, y_SO2)
% ylabel('S_O_,_5 (g/m^3)')
% xlabel('time (d)')
% title('S_O_,_5 vs time')
% grid on

% % hold on SNHp,5 SNH5
% figure
% plot(x_tk, y_SOp2)
% hold on
% plot(x_tk, y_SO2)
% title('S_O_p_,_5, S_O_,_5 vs time')
% ylabel('S_O_p_,_5, S_O_,_5 (g/m^3)')
% xlabel('time (d)')
% legend('Plant', 'Model')
% grid on

%% SNH2
y_SNHp2= cellflat(record_SNHp2_transient(1:end));
y_SNHp2= cell2mat(y_SNHp2);

figure
plot(x_tk, y_SNHp2)
ylabel('S_N_H_p_,_5 (g/m^3)')
xlabel('time (d)')
title('S_N_H_p_,_5 vs time')
yline(4,'r--', 'upper limit');
ylim([0, 5])
grid on

% % model
% y_SNH2= cellflat(record_SNH2_transient(1:end));
% y_SNH2= cell2mat(y_SNH2);
% figure
% plot(x_tk, y_SNH2)
% ylabel('S_N_H_,_5 (g/m^3)')
% xlabel('time (d)')
% title('S_N_H_,_5 vs time')
% grid on

% % hold on SNHp,5 SNH5
% figure
% plot(x_tk, y_SNHp2)
% hold on
% plot(x_tk, y_SNH2)
% title('S_N_H_p_,_5, S_N_H_,_5 vs time')
% ylabel('S_N_H_p_,_5, S_N_H_,_5 (g/m^3)')
% xlabel('time (d)')
% legend('Plant', 'Model')
% grid on

