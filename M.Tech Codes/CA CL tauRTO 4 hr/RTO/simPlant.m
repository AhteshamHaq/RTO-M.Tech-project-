
cd ..
%[Sno2,Snh5,So5,Qa,KLa,Snop1_sp_u,Sop5_sp_u]
Snop2_sp_u = uopt(end-1);  % This value goes to BSM1 plant as input
Sop5_sp_u = uopt(end);  % This value goes to BSM1 plant as input
cd Plant
simulatePlant                     % Simulate the full BSM1 at current input
cd ..

cd RTO