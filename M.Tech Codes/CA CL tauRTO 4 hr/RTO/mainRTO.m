% (PC-07)   check simPlant
% Current run discription
% (currently, K=0.5 )
% model objfunc and consraints are used as plant objfunc and constraints

%% Setup environment
clc; clear;
close all
tf0 = 60;
tf_RTO = 4*(1/24); % hr
no_of_itr = 40/tf_RTO;

%% Defines the filter
K = 0.3; % report
Ing = eye(1);
Inu = eye(2);
% K*Ing will give diagonal matrix, dim [ng x ng] = [3x3]
% K*Inu will give diagonal matrix, dim [nu x nu] = [2x2]

%% Optimization using steadystae model(RM)
itr =0 ;

% AddtoPath
addpath('..\optimization_model')

% Run optimizer
set_initialBounds = 1; % set initial bounds on
set_modifyBounds = 0; % set modify bounds off
MAIN_opt_modelCasAdi
uopt_orgnl = uopt; 
uopt(1) = 1; 
uopt(2) = 2;

tf = tf0;
tf_plant = tf0;
% Simulate the plant at current optima
simPlant
% Simulate the plant at current optima
simModel

zeroth_orderModifier % dummy, not used in ploting
% Initiate the modifiers
m0G   = zeros(length(Ing),1);               % m0G dim [ngx1] = [3x1]

% record the data
recordData

%% iterations
% ð?‘¡_ð?‘˜ is the time at which the ð?‘˜^ð?‘¡â„Ž iteration ends
tf = tf_RTO;
tf_plant = tf_RTO;
tk = 0;
x_tk = [];

uopt = uopt_orgnl; 
for itr = 1:no_of_itr
    
    %2 Simulate the plant and model at current model optima
    % Simulate the plant at current optima
    simPlant
    % Simulate the plant at current optima
    simModel
    
    %% find the modifiers and display them
    zeroth_orderModifier        % an .m-file to compute the modifiers
    % Apply filter on the modifiers
    m0G     = (K*Ing)*m0G_itr + (Ing-(K*Ing))*m0G;   % m0G dim [ngx1] = [2x1]
    
    Snh5p_k=z_uk
    displayModifiersData  % displayModifiersData is a .m-file to show the modifiers in command window
    fprintf(2,['-----------------------------------------------',num2str(itr),'--------------------------------------------- \n'])
    
    %% Record/store data
    recordData % recordData is a .m-file to save some information at each itration
    tk = tk(end)+ xk(:,21);
    x_tk = [x_tk; tk];
    
    % do not run the optimizer for last iteration
    if itr < no_of_itr
        % Run optimizer for next iteration (with modifiers)
        set_initialBounds = 0; % set initial bounds on
        set_modifyBounds = 1; % set modify bounds off
        
        MAIN_opt_modelCasAdi  % optimizer is a .m-file to sovle the optimization problem
    end
    
    if itr>no_of_itr+1
        plotResults  % Plots inputs and cost function against iterations
        seeChange    % Plots different in modifier values for two successive iterations
        plotTransient
    end
end
%%
save record record_fval record_xopt K record_m0G record_Gp record_G record_xopt...
    record_SOp2_transient record_SO2_transient x_tk
plotResults  % Plots inputs and cost function against iterations
plotTransient
% seeChange    % Plots different in modifier values for two successive iterations