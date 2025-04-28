clc;clear;close all
Qa_u1 = 21288.1796;
KLa_u2 = 159.097;

utest = [Qa_u1; KLa_u2];
tf_plant = 50; % Time horizon

%%
show_plot = 0;
import casadi.*
optBSM1 = casadi.Opti();

%% Declare Plant variables
reactor1Vars
reactor2Vars

t = optBSM1.variable();
Qa = optBSM1.variable(); KLa = optBSM1.variable();
x = [reac1Vars; reac2Vars; t];
u = [Qa; KLa];

%% Plant equations
model_equations
xdot = ode;

%% Formulate discrete time dynamics

% CVODES from the SUNDIALS suite
dae = struct('x',x,'p',u,'ode',xdot);

%% Evaluate at a test point
load statesm
XINIT = [XINIT(1:18),0];
xinit = XINIT';
% utest = [19549.0583; 156.2793];

%% simulate
% tf = 50;
sampleTime =1/96;
N = tf_plant/sampleTime;

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
time = linspace(0, tf_plant, N+1);

X = [SNO1', SO2', SNH2']; %, uopt*ones(length(SNO1),2)];
xss = [SNO1(end), SO2(end), SNH2(end), utest'];
zss_disp = mat2str(round(xss,4))

%% % clf;
if show_plot
close all
figure
plot(time, SNO1,'-.')
title('S_N_O_,_1 vs time')
xlabel('t (days)')
ylabel('S_N_O_,_1 (g/m^3)')
xlim([0,tf_plant])
grid on

figure
plot(time, SO2,'-.')
title('S_O_,_2 vs time')
xlabel('t (days)')
ylabel('S_O_,_2 (g/m^3)')
xlim([0,tf_plant])
grid on

figure
plot(time, SNH2, '-.')
title('S_N_H_,_2 vs time')
xlabel('t (days)')
ylabel('S_N_H_,_2 (g/m^3)')
xlim([0,tf_plant])
grid on
end
