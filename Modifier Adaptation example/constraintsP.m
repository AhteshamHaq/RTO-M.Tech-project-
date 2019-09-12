function  [c,ceq] = constraintsP(u)
theta2 = 2.5;
theta3 = -0.4;
theta4 = 1.0;

c = (u(1)-theta2)^2 - 4*(u(2)-theta4)*theta3-2;
ceq = [];
end