% clc;clear;close all
tic

%% OPTIMIZATION starts here 

% Assigns initial values to the decision variables
u1 = 2;
u2 = 0.5;
x0 = [u1,u2];

% Objective function and Non-linear constraints FUNCTION HANDLES
func = @(x)cost(x);
nonlcon = @(x)constraints(x);

%% Equality constraints (Not available)
A = [];
b = [];
Aeq = [];
beq = [];

%% bounds on variables

% lb(lower bounds)
lb = -Inf(size(x0));            % All variables are non-negative. Hence lowest possible value for them is zero.

% ub (upper bounds)
ub = Inf(size(x0));              % All variables are positive. Hence highest possible value for them is infinity.

%% Optimization solver for model optimization
options = optimoptions('fmincon','Algorithm','sqp');
% Display iteration
options = optimoptions(options,'Display','off');

%% Calling the solver
[xopt,fval,exitflag,output,lambda,grad,hessian] = fmincon(func,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
% line 474 of fmincon:  Checks that initial point strictly satisfies the bounds on the variables
% That is why running the optimizer says " Your initial point x0 is not between bounds lb and ub; FMINCONshifted x0 to strictly satisfy the bounds."

%% Display the results
initobj = cost(x0);
finalobj = cost(xopt);
disp(['Objective function before optimization: ',num2str(initobj)]) % objective function before optimization (Qai = 3*Qin; KLai = 240)
disp(['Objective function after optimization : ',num2str(finalobj)])  % objective function after optimization at optimum value of Qai and KLai
xopt
fprintf(2,['exitflag = ', num2str(exitflag)])        % 'exitflag = 1' means local minima is found 

%%
disp(' ')
toc             % shows the computational time
fprintf(2,'--------------------------------------------------------------------------------------------- \n')