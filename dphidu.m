function val = dphidu(u,k)
theta1 = 2.0;

if k==1
    val = 2*(u(1)-theta1);
end

if k==2
    val = 8*(u(2)-2.5);
end 

end