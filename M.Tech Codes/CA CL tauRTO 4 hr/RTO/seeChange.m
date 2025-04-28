%% See the modifiers change
clear changem0G changem0phi changem1G changem1phi
% close all
n=itr;

%% changem0G
for i = 1:n
    i;
    changem0G{i,1} = record_m0G{i+1} - record_m0G{i};
    normm0G(i) = norm(changem0G{i,1});
end
figure(12)
hold on 
plot_styles(1:n,normm0G);
title('normm0G vs iteration')
xlabel('iteration')
ylabel('normm0G')
legend
grid on

% %% changem1G
% for i = 2:n
%     i;
%     changem1G{i,1} = record_m1G{i} - record_m1G{i-1};
%     normm1G(i) = norm(changem1G{i,1});
% end
% figure(14)
% hold on 
% plot_styles(1:n,normm1G);
% title('normm1G vs iteration')
% xlabel('iteration')
% ylabel('normm1G')
% legend