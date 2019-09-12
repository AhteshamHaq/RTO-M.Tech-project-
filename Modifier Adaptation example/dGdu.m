function val = dGdu(u,k)
theta2 = 1.5;
if k==1
    val = 2*(u(1)-theta2);
end

if k==2
    val = -4;
end 

end