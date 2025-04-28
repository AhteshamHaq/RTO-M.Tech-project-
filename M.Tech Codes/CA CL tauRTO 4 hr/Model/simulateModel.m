% clc;clear;close all
% 
% Sno1_sp_u = 0.5;
% So2_sp_u = 1;
% tf = 50; % Time horizon

utest = [Sno1_sp_u; So2_sp_u];

%%
show_plot = 0;

import casadi.*
optBSM1 = casadi.Opti();

%% Declare model variables
reactor1Vars
reactor2Vars

t = optBSM1.variable();
Qa = optBSM1.variable(); KLa = optBSM1.variable();
Sno1_sp = optBSM1.variable();
So2_sp = optBSM1.variable();
x = [reac1Vars; reac2Vars; Qa; KLa; t];
u = [Sno1_sp; So2_sp];

%% model equations
model_equations
xdot = ode;

%% Formulate discrete time dynamics

% CVODES from the SUNDIALS suite
dae = struct('x',x,'p',u,'ode',xdot);

%% Evaluate at a test point
load statesm
XINIT = [XINIT(1:20),0];
xinit = XINIT';

%% simulate
sampleTime =1/96;
N = tf/sampleTime;

if true
    opts = struct('tf',sampleTime);
    % opts = struct('tf',10);
    F = integrator('F', 'cvodes', dae, opts);
    sim = F.mapaccum('mapaccum',N);
    sim_out = sim('x0',xinit,'p',utest);
    xk = sim_out.xf;
    xk = full(xk);
    xk = [xinit,xk];
end

xk = xk';

XINIT = xk(end,:);
save statesm XINIT

SNO1 = xk(:,6)';
SO2 = xk(:,14)';
SNH2 = xk(:,16)';
Qa_ctrl = xk(:,19);
KLa_ctrl = xk(:,20);
time = linspace(0, tf, N+1);

X = [SNO1', SO2', SNH2']; %, uopt*ones(length(SNO1),2)];
xss = [SNO1(end), SO2(end), SNH2(end), Qa_ctrl(end), KLa_ctrl(end), utest'];
xss_disp = mat2str(round(xss,4))

%% % clf;
if show_plot
close all
figure
plot(time, SNO1,'-.')
title('S_N_O_,_1 vs time')
xlabel('t (days)')
ylabel('S_N_O_,_1 (g/m^3)')
xlim([0,tf])
grid on

figure
plot(time, SO2,'-.')
title('S_O_,_2 vs time')
xlabel('t (days)')
ylabel('S_O_,_2 (g/m^3)')
xlim([0,tf])
grid on

figure
plot(time, SNH2, '-.')
title('S_N_H_,_2 vs time')
xlabel('t (days)')
ylabel('S_N_H_,_2 (g/m^3)')
xlim([0,tf])
grid on
end
