clc;clear;close all
Sop5_sp_u = 0.8122;%13767.9329;
tf_plant = 50; % Time horizon

Snop2_sp = 0.5;
utest = Sop5_sp_u;
show_plot = 0;

%%
import casadi.*
optBSM1 = casadi.Opti();

%% Declare Plant variables
reactor1Vars
reactor2Vars
reactor3Vars
reactor4Vars
reactor5Vars
t = optBSM1.variable();
Qap = optBSM1.variable(); KLap = optBSM1.variable();
Sop5_sp= optBSM1.variable();
x = [reac1Vars; reac2Vars; reac3Vars; reac4Vars; reac5Vars; Qap; KLap; t];
u = Sop5_sp;

%% Plant equations
plant_equations
xdot = ode;

%% Formulate discrete time dynamics

% CVODES from the SUNDIALS suite
dae = struct('x',x,'p',u,'ode',xdot);

%% Evaluate at a test point
load statesp
ZINIT = [ZINIT(1:47),0];
zinit = ZINIT';

%% simulate
sampleTime =1/96;
N = tf_plant/sampleTime;

if true
    opts = struct('tf',sampleTime);
    % opts = struct('tf',10);
    F = integrator('F', 'cvodes', dae, opts);
    sim = F.mapaccum('mapaccum',N);
    sim_out = sim('x0',zinit,'p',utest);
    zk = sim_out.xf;
    zk = full(zk);
    zk = [zinit,zk];
end

zk = zk';

ZINIT = zk(end,:);
save statesp ZINIT

SNO2 = zk(:,15)';
SO5 = zk(:,41)';
SNH5 = zk(:,43)';
Qap_ctrl = zk(:,46);
KLap_ctrl = zk(:,47);
time = linspace(0, tf_plant, N+1);

Z = [SNO2', SO5', SNH5']; %, uopt*ones(length(SNO1),2)];
zss = [SNO2(end), SO5(end), SNH5(end), Qap_ctrl(end),  KLap_ctrl(end), utest];
zss_disp = mat2str(round(zss,4))

%% % clf;
if show_plot
close all
figure
plot(time, SNO2,'-.')
title('S_N_O_2 vs time')
xlabel('t (days)')
ylabel('S_N_O_2 (g/m^3)')
xlim([0,tf_plant])
grid on

figure
plot(time, SO5,'-.')
title('S_O_5 vs time')
xlabel('t (days)')
ylabel('S_O_5 (g/m^3)')
xlim([0,tf_plant])
grid on

figure
plot(time, SNH5, '-.')
title('S_N_H_5 vs time')
xlabel('t (days)')
ylabel('S_N_H_5 (g/m^3)')
xlim([0,tf_plant])
grid on
end
