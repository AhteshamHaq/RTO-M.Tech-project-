function  [c,ceq] = constraints(u, m0G, m1G, uk)
theta2 = 1.5;
theta3 = -0.5;
theta4 = 0.5;

c = (u(1)-theta2)^2 - (4*(u(2)-theta4)*theta3) -2;
ceq = [];

if (nargin > 1)
    c = c' + m0G + m1G'*(u-uk)';
    c = c';  % c dim [1 x ng] = [1x1]
end

end