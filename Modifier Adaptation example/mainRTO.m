clc;clear; close all
%0.=>
plotOptima
figure(102)
plot(1:100, finalobjP*ones(1,100))
%1.=> Optimization
optimizer0
% 2.=> modifiers at current optimal inputs
modifiers

%3.=> Apply filter on the modifiers
K = 0.2; % filter
Ing = eye(1);
Inu = eye(2);

m0phi   = K*m0phi_itr;                 % m0phi is scaler with dim [1x1]
m0G     = K*Ing*m0G_itr;               % m0G dim [ngx1] = [8x1]
m1phi   = K*Inu*transpose(m1phi_itrT); % m1phi dim [nux1] = [2x1]
m1G     = K*Inu*transpose(m1G_itrT);   % m1G  dim [nu x ng] = [2x8]

% uk is constant used while applying first-order modifier
uk = xopt;

% Iterations
for itr = 1:100
    %% Objective function and Non-linear constraints FUNCTION HANDLES
    func = @(x) cost(x, m0phi_itr, m1phi, uk); % uk is constant here
    nonlcon = @(x) constraints(x, m0G, m1G, uk); % uk is constant here
    optimizer  % optimizer is a .m-file to sovle the optimization problem
    
    %displayModifiers  % displayModifiers is a .m-file to show the modifiers in command window
    uk = xopt; % uk is constant in modifier adaptation (uk = uitr)
    
    modifiers % modifiers is a .m-file to compute the modifiers
    %     Applying filter
    m0phi   =  K*m0phi_itr                    + (1-K)*m0phi;         % m0phi is scaler with dim [1x1]
    m0G     = (K*Ing)*m0G_itr                 + (Ing-(K*Ing))*m0G;   % m0G dim [ngx1] = [8x1]
    m1phi   = (K*Inu)*transpose(m1phi_itrT)   + (Inu-(K*Inu))*m1phi; % m1phi dim [nux1] = [2x1]
    m1G     = (K*Inu)*transpose(m1G_itrT)     + (Inu-(K*Inu))*m1G;   % m1G  dim [nu x ng] = [2x8]
    
    figure(101)
    plot(xopt(1),xopt(2),'*')
    
    figure(102)
    hold on
    plot(itr,costP(xopt),'k.')
    %     pause(1)
    recordData % recordData is a .m-file to save some information at each itration
end
legend('Plant optima', 'Model optima with iteratoins')
%%
plotResults  % Plots inputs and cost function against iterations
seeChange    % Plots different in modifier values for two successive iterations