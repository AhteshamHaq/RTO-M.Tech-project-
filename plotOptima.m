clc; clear; close all
figure(101);
PLANTplotCostConstraints
hold on

MODELplotCostConstraints
hold on

optimizerP
xoptP = xopt;
plot(xoptP(1),xoptP(2),'k.')
text(xoptP(1),xoptP(2),'P','HorizontalAlignment','center','VerticalAlignment','bottom')

optimizer0
xoptM =xopt;
plot(xoptM(1),xoptM(2),'k.')
text(xoptM(1),xoptM(2),'M','HorizontalAlignment','center','VerticalAlignment','bottom')
