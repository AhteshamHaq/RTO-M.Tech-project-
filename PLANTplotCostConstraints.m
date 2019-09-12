% This m-file plots plant cost & constraimts function as contours

%% cost plot
f = @(u1,u2)costpPlot(u1,u2);
costPlot = fcontour(f);
costPlot.XRange = [1,3.5];
costPlot.YRange = [1,2.5];
costPlot.LevelList = -1:0.2:10;
xlabel u1
ylabel u2
grid on
hold on


%% constraint plot
f = @(u1,u2)constpPlt(u1,u2);
constpPlot = fcontour(f);
constpPlot.LevelList = 0;
constpPlot.LineColor ='r';
constpPlot.XRange = [1,3.5];
constpPlot.YRange = [1,2.5];
xlabel u1
ylabel u2
grid on

%% Functions 
function J = costpPlot(u1,u2)
theta1 = 3.5;
J = (u1- theta1).^2 + 4*(u2-2.5).^2;
end

function c = constpPlt(u1,u2)
theta2 = 2.5;
theta3 = -0.4;
theta4 = 1.0;

c = (u1-theta2).^2 - (4*(u2-theta4)*theta3) - 2;
end