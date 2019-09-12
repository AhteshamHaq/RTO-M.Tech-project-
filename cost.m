function J = cost(u,m0phi,m1phi,uk)
theta1 = 2.0;
J = (u(1)- theta1)^2 + 4*(u(2)-2.5)^2;

if (nargin > 1)
    J = J+ m0phi + m1phi'*(u-uk)'; % no constant terms are added as modifier
    % adding constant term to cost function does not alter the optima
end
end