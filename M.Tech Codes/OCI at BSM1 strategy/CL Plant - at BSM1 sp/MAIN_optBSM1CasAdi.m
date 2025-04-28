clc;clear;close all
%% Import CasADi
import casadi.*
optBSM1 = casadi.Opti();
Sop5_sp = 2;

%% Define variables
reactor1Vars
reactor2Vars
reactor3Vars
reactor4Vars
reactor5Vars
Qap = optBSM1.variable(); KLap = optBSM1.variable();

%% 
plant_equations

%% bounds on states
% Positive bounds on All states
boundsReactor1
boundsReactor2
boundsReactor3
boundsReactor4
boundsReactor5

% Bounds on controlled variables
optBSM1.subject_to(180 <= Qap <=92000);
optBSM1.subject_to(1.5 <= KLap  <= 240);
optBSM1.subject_to( Snop2 == 1);
% optBSM1.subject_to(0.5 <= Sop5  <= 5);
optBSM1.subject_to(  0 <= Snhp5 <= 4);

%% Cost function
cost = (0.004*Qap)+ 1333/75*KLap;

%% Optimization setup
% Cost function
optBSM1.minimize(cost)
% Constraints
assignConstraints

% initial point to start the optimization
% Reactor states
initOptReactor1
initOptReactor2
initOptReactor3
initOptReactor4
initOptReactor5
% Inputs
optBSM1.set_initial(Qap,18446);
optBSM1.set_initial(KLap,146);

% NLP options
options = struct;
options.ipopt.max_iter = 1000;
options.ipopt.acceptable_iter = 500;
options.ipopt.acceptable_tol = 1e-6;
options.ipopt.tol = 1e-6;

%% Solve the NLP
try
    optBSM1.solver('ipopt',options);
    sol = optBSM1.solve;
    xopt = sol.value([Snop2,Sop5,Snhp5,Qap,KLap]);
    xopt_disp = mat2str(round(xopt,4))
    fval = sol.value(cost)
catch %the error
    %% If solver fails
    disp('-----------------------------------------------------------------')
    fprintf(2,'ERROR OCURRED\n')
    xErr = optBSM1.debug.value([Snop2,Sop5,Snhp5,Qap,KLap])
end

uopt =  xopt([4,5]);
% xopt = sol.value([Salk1,Salk2,Salk3,Salk4,Salk5])