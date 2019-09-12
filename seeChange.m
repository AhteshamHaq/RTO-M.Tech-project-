%% See the modifiers change
clear changem0G changem0phi changem1G changem1phi
% close all
n=itr-1;
%% changem0phi
for i = 2:n
    i;
    changem0phi{i,1} = m0phiRecord{i} - m0phiRecord{i-1};
    normm0phi(i) = norm(changem0phi{i,1});
end
figure(11)
hold on 
plot_styles(1:n,normm0phi);
title('norm of change in m0phi vs iteration')
xlabel('iteration')
ylabel('normm0phi')
legend

%% changem0G
for i = 2:n
    i;
    changem0G{i,1} = m0GRecord{i} - m0GRecord{i-1};
    normm0G(i) = norm(changem0G{i,1});
end
figure(12)
hold on 
plot_styles(1:n,normm0G);
title('norm of change in m0G vs iteration')
xlabel('iteration')
ylabel('normm0G')
legend

%% changem1phi
for i = 2:n
    i;
    changem1phi{i,1} = m1phiRecord{i} - m1phiRecord{i-1};
    normm1phi(i) = norm(changem1phi{i,1});
end
figure(13)
hold on 
plot_styles(1:n,normm1phi);
title('norm of change in m1phi vs iteration')
xlabel('iteration')
ylabel('normm1phi')
legend

%% changem1G
for i = 2:n
    i;
    changem1G{i,1} = m1GRecord{i} - m1GRecord{i-1};
    normm1G(i) = norm(changem1G{i,1});
end
figure(14)
hold on 
plot_styles(1:n,normm1G);
title('norm of change in m1G vs iteration')
xlabel('iteration')
ylabel('normm1G')
legend