% zeroth_orderModifier

%% Plant graidients (constraints)
du = [100 1]; % du = is chosen to be smaller value
du = diag(du);

gradphip = [];
gradGp = [];

% For loop to perturb one input and keep other constant
dataz = {'firstorderz1','firstorderz2'};
tempStore_uopt = uopt; % Store uopt before perturbation
for i=1:2
    
    u_kdu = uopt + du(i,:); % Evaluate perturbed input
    % Modify the xopt with perturbed value
    uopt(1) = u_kdu(1);
    uopt(2) = u_kdu(2);
    
    % Run plant at perturbed input and save the values
    simPlant
    cd 'itrertaions data store'
    cd(folder)
    save(dataz{i},'z')
    %     load(dataz{i})
    cd ..
    cd ..
    
    uopt = tempStore_uopt; % Reset uopt from the temp_uopt
    % Calculate plant constraints gradient at current input
    % z_ukdu{i} is z@u+du
    z_ukdu{i} = z(62);
    Gp_ukdu{i} = -1*z_ukdu{i};
    Gp_ukdu{i} = Gp_ukdu{i}';
    dGp = (Gp_ukdu{i} - Gp_uk)/du(i,i);
    gradGp = [gradGp, dGp];
end

%% Model graidients (constraints)
% Evaluating the gradients of G
gradG = [];
% For loop to perturb one input and keep other constant
datax = {'firstorderx1','firstorderx2'};
for i=1:2
    % two inputs u = [Qa, KLa];
    u_kdu = uopt + du(i,:); % Evaluate perturbed input
    % Modify the uopt with perturbed value
    uopt(1) = u_kdu(1);
    uopt(2) = u_kdu(2);
    
    % Simulate model at perturbed input and save the values
    simModel
    cd 'itrertaions data store'
    cd(folder)
    save(datax{i},'x')
    %     load(datax{i})
    cd ..
    cd ..
    
    % Restore current uopt (assign tempStore_uopte to the uopt)
    uopt = tempStore_uopt;
    
    % Calculate model constraints gradient at current input (ssvalues at u+du)
    x_ukdu{i} = x(62);
    G_ukdu{i} = -1*x_ukdu{i};
    G_ukdu{i} = G_ukdu{i}';
    dG = (G_ukdu{i} - G_uk)/du(i,i);
    gradG = [gradG, dG];
    
end

%% First-order modifier
m1G_itrT = [gradGp - gradG];
