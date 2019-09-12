% close all
%% plot_styles the u1 u2 fval etc vs iterations
nItr = length(xoptRecord);
for i=1:nItr
    u1Result(i) = xoptRecord{i}(1);
    u2Result(i) = xoptRecord{i}(2);
    finalobjResult(i) = finalobjRecord{i}(1);
    initobjResult(i) = initobjRecord{i}(1);
    fvalResult(i) = fvalRecord{i}(1);
end

figure(1)
hold on
plot_styles(1:nItr,u2Result);
title('u2 vs iteration')
xlabel('iteration')
ylabel('u2')
grid on
legend

figure(2)
hold on
plot_styles(1:nItr,u1Result);
xlabel('iteration')
ylabel('u1')
title('u1 vs iteration')
grid on
legend

figure(3)
hold on
plot_styles(1:nItr,finalobjResult);
xlabel('iteration')
ylabel('finalobj')  % finalobj is cost function value without modification
title('finalobj vs iteration')
grid on
legend

figure(4)
hold on
plot_styles(1:nItr,initobjResult);
xlabel('iteration')
ylabel('initobj')
title('initobj vs iteration')
grid on
legend

figure(5)
hold on
plot_styles(1:nItr,fvalResult);
xlabel('iteration')
ylabel('fval') % fval is cost function value with modifier adpatation
title('fval vs iteration')
grid on
legend