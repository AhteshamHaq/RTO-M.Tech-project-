% This m-file plots plant cost & constraimts function as contours

%% cost plot
f = @(u1,u2)costm(u1,u2);
costPlot = fcontour(f);
costPlot.XRange = [1,3.5];
costPlot.YRange = [1,2.5];
costPlot.LevelList = 3:1:10;
costPlot.LineStyle = '--';
xlabel u1
ylabel u2
grid on
hold on


%% constraint plot
f = @(u1,u2)constm(u1,u2);
constmPlot = fcontour(f,[1,3.5]);
constmPlot.LevelList = 0;
constmPlot.LineColor ='r';
constmPlot.XRange = [1,3.5];
constmPlot.YRange = [1,2.5];
constmPlot.LineStyle = '--';
xlabel u1
ylabel u2
grid on

%% Functions 
function J = costm(u1,u2)
theta1 = 2.0;
J = (u1- theta1).^2 + 4*(u2-2.5).^2;
end

function c = constm(u1,u2)
theta2 = 1.5;
theta3 = -0.5;
theta4 = 0.5;

c = (u1-theta2).^2 - (4*(u2-theta4)*theta3) - 2;
end