clc;clear;close all
%% Import CasADi
import casadi.*
optBSM1 = casadi.Opti();
So2_sp = 2;

%% Define variables
reactor1Vars
reactor2Vars

Qa = optBSM1.variable(); KLa = optBSM1.variable();

%% 
model_equations

%% bounds on states
% Positive bounds on All states
boundsReactor1
boundsReactor2

% Bounds on controlled variables
optBSM1.subject_to(180 <= Qa <= 92000);
optBSM1.subject_to(1.5 <= KLa  <= 240);
optBSM1.subject_to(0.1 <= Sno1 <= 5);
optBSM1.subject_to(0.5 <= So2  <= 5);
optBSM1.subject_to(  0 <= Snh2 <= 4);

%% Cost function
cost = (0.004*Qa)+ 1333/75*KLa;

%% Optimization setup
% Cost function
optBSM1.minimize(cost)
% Constraints
assignConstraints

% initial point to start the optimization
% Reactor states
initOptReactor1
initOptReactor2

% Inputs
optBSM1.set_initial(Qa,18446);
optBSM1.set_initial(KLa,146);

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
    xopt = sol.value([Sno1,So2,Snh2,Qa,KLa]);
    xopt_disp = mat2str(round(xopt,4))
    fval = sol.value(cost)
catch  error
    %% If solver fails
    disp('-----------------------------------------------------------------')
    fprintf(2,'ERROR OCURRED\n')
    xErr = optBSM1.debug.value([Sno1,So2,Snh2,Qa,KLa])
    
    throw(error)
end

uopt =  xopt([4,5]);
% xopt = sol.value([Salk1,Salk2,Salk3,Salk4,Salk5])