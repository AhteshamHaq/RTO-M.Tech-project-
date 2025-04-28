%% zeroth-order modifiers
% This .m-file calulates the zeroth-order modifiers to be introduced in the
% cost function and constraints(MA)

%% Plant parameters (to get the zeroth-order modifier)
SNOp1_transient = Z(:,1);
SOp2_transient = Z(:,2);
SNHp2_transient = Z(:,3);

% parameters
%=> Plant(Gp)
z_uk =  zss(3); %zss([3,6,8]); [SNOp1, SOp2, SNHp2]
Gp_uk = -1*z_uk;
Gp_uk = Gp_uk';

%% Model parameters (to get the zeroth-order modifier)
SNO1_transient = X(:,1);  %[SNOp1, SOp2, SNHp2]
SO2_transient = X(:,2);
SNH2_transient = X(:,3);

% Parameters
% => Model(Gm)
x_uk = xss(3); %[SNOp1, SOp2, SNHp2]
G_uk = -1*x_uk;
G_uk = G_uk';

%%  zeroth-order modifiers
% Modifier(m0G)
m0G_itr = (Gp_uk-G_uk);