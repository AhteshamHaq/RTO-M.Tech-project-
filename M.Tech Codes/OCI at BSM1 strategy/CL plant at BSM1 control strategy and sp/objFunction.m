Qa = 17286.8657;
KLa3 = 240;
KLa4 = 240;
KLa5 = 128.4775;

cost = ((0.004*Qa)+ (1333*Sopsat/1800)*(KLa3+KLa4+KLa5)) %3.6740e+03

%% tested the above equation and found correct
% KLa3 = 177.5458;
% KLa4 = KLa3;
% KLa5 = KLa4;
% Qa = 23272.0322;
% 
% cost = ((0.004*Qa)+ (1333*Sopsat/1800)*(KLa3+KLa4+KLa5))  %3.2487e+03
