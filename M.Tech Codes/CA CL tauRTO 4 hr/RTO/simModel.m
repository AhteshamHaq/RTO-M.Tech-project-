
cd ..
%[Sno2,Snh5,So5,Qa,Sno1_sp_u, So2_sp_u]
Sno1_sp_u = uopt(end-1);     % This value goes to BSM1 plant as input
So2_sp_u = uopt(end);     % This value goes to BSM1 plant as input
cd Model
simulateModel                     % Simulate the Model at current input
cd ..

cd RTO