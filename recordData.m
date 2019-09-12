%% Record modifiers and other paras 
% This .m-file records grad and modifiers and other data
i=itr;

phipRecord{i,1}      = phip;
phimRecord{i,1}      = phi;
GpRecord{i,1}        = Gp;
GmRecord{i,1}        = G;

gradphipRecord{i,1}  = gradphip;
gradphimRecord{i,1}  = gradphi;
gradGpRecord{i,1}    = gradGp;
gradGmRecord{i,1}    = gradG;

m0phiRecord{i,1}     = m0phi;
m0GRecord{i,1}       = m0G;
m1phiRecord{i,1}     = m1phi;
m1GRecord{i,1}       = m1G;
xoptRecord{i,1}      = xopt;

initobjRecord{i,1}   = initobj;
finalobjRecord{i,1}  = finalobj;
fvalRecord{i,1}      = fval;
exitflagRecord(i)   = exitflag;
outputRecord{i,1}    = output;
lambdaRecord{i,1}    = lambda;
gradRecord{i,1}      = grad;
hessianRecord{i,1}   = hessian;