%% Record modifiers and other paras
% This .m-file records grad and modifiers and other data
k=itr+1;

%% zeroth-order modifier
record_m0G{k,1}       = m0G;
record_Gp{k,1}        = Gp_uk;
record_G{k,1}         = G_uk;

% %% first-order modifier
% record_m1G{k,1}       = m1G;
% record_gradGp{k,1}   =gradGp; %1. dGpdQa, 2. dGpdKla
% record_gradG{k,1}    =gradG;  %1. dGdQa,  2. dGdKla

%% Record transient
if itr>0
    record_SNOp1_transient{k,1}  = SNOp1_transient';
    record_SNO1_transient{k,1}  = SNO1_transient';
    
    record_SOp2_transient{k,1}  = SOp2_transient';
    record_SO2_transient{k,1}  = SO2_transient';
    
    record_SNHp2_transient{k,1}  = SNHp2_transient';
    record_SNH2_transient{k,1}  = SNH2_transient';
    
    record_Qap_transient{k,1} = Qap_ctrl';
    record_KLap_transient{k,1} = KLap_ctrl';

end

%% Optimization Results store
cost_p = ((0.004*Qap_ctrl(end))+ (V2*Sopsat/1800)*KLap_ctrl(end));
record_fval{k,1}      = cost_p; % Objective function value
record_xopt{k,1}      = xopt;
record_uopt{k,1}      = [Qap_ctrl(end), KLap_ctrl(end)];
