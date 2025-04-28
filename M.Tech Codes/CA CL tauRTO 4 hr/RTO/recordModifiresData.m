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
