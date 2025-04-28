%% zeroth-order modifiers
% This .m-file calulates the zeroth-order modifiers to be introduced in the
% cost function and constraints(MA)

%% Plant parameters (to get the zeroth-order modifier)

% Simulate the plant at current optima
simPlant
% cd 'itrertaions data store'
% cd(folder)
SNOp1_transient = Z(:,1);
SOp2_transient = Z(:,2);
SNHp2_transient = Z(:,3);
% save('ztransient','SNHp2_transient')
% save('zerothorderz','zss')
% % load('zerothorderz')
% cd ..
% cd ..

% parameters
%=> Plant(Gp)
z_uk =  zss(2); %zss([3,6,8]); [SNOp1, SOp2, SNHp2]
Gp_uk = -1*z_uk;
Gp_uk = Gp_uk';

%% Model parameters (to get the zeroth-order modifier)
% No need to simulate model, take the states from current xopt

% Parameters
% => Model(Gm)
simModel
% cd 'itrertaions data store'
% cd(folder)
SNO1_transient = X(:,1);  %[SNOp1, SOp2, SNHp2]
SO2_transient = X(:,2);
SNH2_transient = X(:,3);
% save('xtransient','SNH2_transient')
% save('zerothorderx','xss')
% % load('zerothorderz')
% cd ..
% cd ..

x_uk = xss(2); %[SNOp1, SOp2, SNHp2]
% x_uk = xopt(3);
G_uk = -1*x_uk;
G_uk = G_uk';

%%  zeroth-order modifiers
% Modifier(m0G)
m0G_itr = (Gp_uk-G_uk);