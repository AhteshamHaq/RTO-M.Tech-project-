close all

Qap_opt = 34460.9604;
KLap_opt = 153.808;
fval_opt = 2.8722e+03;

%% plot_styles the Qa KLa fval etc vs iterations
nItr = itr;
for i=1:nItr
    idx = i;
    QaResult(idx) = record_uopt{idx+1}(1);
    KLaResult(idx) = record_uopt{idx+1}(2);
    fvalResult(idx) = record_fval{idx+1}(1);
    GResult(idx)=-1*record_G{idx+1}(1);
    GpResult(idx)=-1*record_Gp{idx+1}(1);   
end


% Qa  vs k
figure(2)
hold on
stairs(1:nItr,QaResult);
xlabel('iteration, k')
ylabel('Q_a_p (m^3/d)')
title('Q_a_p vs iteration')
grid on
yline(Qap_opt, 'r-.', num2str(round(Qap_opt,2)));
legend(strcat('K=',num2str(K)),' optimal Q_a_p')
xlim([1 nItr])

% KLa vs k
figure(1)
hold on
stairs(1:nItr,KLaResult);
title('K_L_a_p vs iteration')
xlabel('iteration, k')
ylabel('K_L_a_p (1/d)')
grid on
yline(KLap_opt,'r-.', num2str(round(KLap_opt,2)));
legend(strcat('K=',num2str(K)), ' optimal K_L_a_p')
xlim([1 nItr])

% fval vs k
figure(3)
hold on
stairs(1:nItr,fvalResult);
xlabel('iteration, k')
ylabel('OCI') % fval is cost function value with modifier adpatation
title('OCI_p vs iteration')
grid on
hyline = yline(fval_opt, 'r-.',num2str(round(fval_opt,2)));
legend(hyline , 'optimal OCI_p')
% legend(strcat('K=',num2str(K)), ' optimal cost_p')
xlim([1 nItr])

%% Qap transient
Qap_transient= cellflat(record_Qap_transient(1:end));
Qap_transient= cell2mat(Qap_transient);

figure
plot(x_tk, Qap_transient)
ylabel('Controller output (m^3/d)')
xlabel('time (d)')
title('Controller output (Q_a_p) vs time')
hyline = yline(Qap_opt,'r-.', num2str(round(Qap_opt,2)));
legend(hyline, ' optimal Q_a_p')
grid on

%% KLap transient
KLap_transient= cellflat(record_KLap_transient(1:end));
KLap_transient= cell2mat(KLap_transient);

figure
plot(x_tk, KLap_transient)
ylabel('Controller output (1/d)')
xlabel('time (d)')
title('Controller output (K_La)_p vs time')
hyline = yline(KLap_opt,'r-.', num2str(round(KLap_opt,2)));
legend(hyline, ' optimal (K_La)_p')
grid on

