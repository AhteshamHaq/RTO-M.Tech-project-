%% ProceSspes involved
proc1 = muH*(Ssp5/(Ks+Ssp5))*(Sop5/(Koh+Sop5))*Xbhp5;
proc2 = muH*(Ssp5/(Ks+Ssp5))*(Koh/(Koh+Sop5))*(Snop5/(Kno+Snop5))*ng*Xbhp5;
proc3 = muA*(Snhp5/(Knh+Snhp5))*(Sop5/(Koa+Sop5))*Xbap5;
proc4 = bh*Xbhp5;
proc5 = ba*Xbap5;
proc6 = ka*Sndp5*Xbhp5;
proc7 = kh*((Xsp5/Xbhp5)/(Kx+(Xsp5/Xbhp5)))*((Sop5/(Koh+Sop5))+nh*(Koh/(Koh+Sop5))*(Snop5/(Kno+Snop5)))*Xbhp5;
proc8 = proc7*Xndp5/Xsp5;

%% Reactions for each state
reac2 = (-proc1-proc2)/Yh+proc7;                        %2. Ssp
reac4 = (1.0-fp)*(proc4+proc5)-proc7;                   %4. Xsp1
reac5 = proc1+proc2-proc4;                              %5. Xbhp
reac6 = proc3-proc5;                                    %6. Xbap
reac8 = -((1.0-Yh)/Yh)*proc1-((4.57-Ya)/Ya)*proc3;      %8. Sop
reac9 = -((1.0-Yh)/(2.86*Yh))*proc2+proc3/Ya;           %9. Snop
reac10 = -ixb*(proc1+proc2)-(ixb+(1.0/Ya))*proc3+proc6; %10. Snhp
reac11 = -proc6+proc8;                                  %11. Sndp
reac12 = (ixb-fp*ixp)*(proc4+proc5)-proc8;              %12. Xndp

%% MaSsp balance equations
dSsp5 = 1.0/V5*((Qin+Qap+Qr)*Ssp4-(Qin+Qap+Qr)*Ssp5)+reac2;
dXsp5 = 1.0/V5*((Qin+Qap+Qr)*Xsp4-(Qin+Qap+Qr)*Xsp5)+reac4;
dXbhp5 = 1.0/V5*((Qin+Qap+Qr)*Xbhp4-(Qin+Qap+Qr)*Xbhp5)+reac5;
dXbap5 = 1.0/V5*((Qin+Qap+Qr)*Xbap4-(Qin+Qap+Qr)*Xbap5)+reac6;
dSop5 = 1.0/V5*((Qin+Qap+Qr)*Sop4-(Qin+Qap+Qr)*Sop5)+reac8+KLap*(Sopsat-Sop5);
dSnop5 = 1.0/V5*((Qin+Qap+Qr)*Snop4-(Qin+Qap+Qr)*Snop5)+reac9;
dSnhp5 = 1.0/V5*((Qin+Qap+Qr)*Snhp4-(Qin+Qap+Qr)*Snhp5)+reac10;
dSndp5 = 1.0/V5*((Qin+Qap+Qr)*Sndp4-(Qin+Qap+Qr)*Sndp5)+reac11;
dXndp5 = 1.0/V5*((Qin+Qap+Qr)*Xndp4-(Qin+Qap+Qr)*Xndp5)+reac12;

