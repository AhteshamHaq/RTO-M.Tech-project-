%% zeroth-order modifier
disp('zeroth-order modifier data')
m0G_afterK = m0G;
m0G_beforeK = m0G_itr;
Sop2 = z_uk;
So2 = x_uk;
So2opt = xopt(3);

m0G_data = table(m0G_afterK, m0G_beforeK, Gp_uk, Sop2, G_uk, So2, So2opt)
