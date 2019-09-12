% current optima
u =xopt;

%% Zeroth order modifiers
% Plant terms
phip = costP(u);
[Gp,~] = constraintsP(u);

% Model terms
phi = cost(u);
[G,~] = constraints(u);

% Modifiers
m0phi_itr = phip-phi;
m0G_itr = Gp-G;

%--------x---------x-----------x------------x------------x-----------x---------%
%% First-order modifiers

% PLANT TERMS
% Plant cost gradient
gradphip = [];
for k=1:2
    gradphip = [gradphip;dphipdu(u,k)];
end
% Plant constraints gradient
gradGp = [];
for k=1:2
    gradGp = [gradGp;dGpdu(u,k)];
end

% MODEL TERMS
% Model cost gradient
gradphi = [];
for k=1:2
    gradphi = [gradphi;dphidu(u,k)];
end
% Model constraints gradient
gradG = [];
for k=1:2
    gradG = [gradG;dGdu(u,k)];
end

% Modifiers
m1phi_itr = gradphip-gradphi;   %[2x1]
m1phi_itrT = m1phi_itr';        %[1 x nu] = [1x2] 
m1G_itr = gradGp-gradG;         %[2x1]
m1G_itrT = m1G_itr';             %[ng x nu] = [1x2] 