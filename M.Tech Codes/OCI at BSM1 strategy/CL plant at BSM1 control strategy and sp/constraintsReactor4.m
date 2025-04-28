%% ProceSspes involved
proc1 = muH*(Ssp4/(Ks+Ssp4))*(Sop4/(Koh+Sop4))*Xbhp4;
proc2 = muH*(Ssp4/(Ks+Ssp4))*(Koh/(Koh+Sop4))*(Snop4/(Kno+Snop4))*ng*Xbhp4;
proc3 = muA*(Snhp4/(Knh+Snhp4))*(Sop4/(Koa+Sop4))*Xbap4;
proc4 = bh*Xbhp4;
proc5 = ba*Xbap4;
proc6 = ka*Sndp4*Xbhp4;
proc7 = kh*((Xsp4/Xbhp4)/(Kx+(Xsp4/Xbhp4)))*((Sop4/(Koh+Sop4))+nh*(Koh/(Koh+Sop4))*(Snop4/(Kno+Snop4)))*Xbhp4;
proc8 = proc7*Xndp4/Xsp4;

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
dSsp4 = 1.0/V4*((Qin+Qap+Qr)*Ssp3-(Qin+Qap+Qr)*Ssp4)+reac2;
dXsp4 = 1.0/V4*((Qin+Qap+Qr)*Xsp3-(Qin+Qap+Qr)*Xsp4)+reac4;
dXbhp4 = 1.0/V4*((Qin+Qap+Qr)*Xbhp3-(Qin+Qap+Qr)*Xbhp4)+reac5;
dXbap4 = 1.0/V4*((Qin+Qap+Qr)*Xbap3-(Qin+Qap+Qr)*Xbap4)+reac6;
dSop4 = 1.0/V4*((Qin+Qap+Qr)*Sop3-(Qin+Qap+Qr)*Sop4)+reac8+240*(Sopsat-Sop4);
dSnop4 = 1.0/V4*((Qin+Qap+Qr)*Snop3-(Qin+Qap+Qr)*Snop4)+reac9;
dSnhp4 = 1.0/V4*((Qin+Qap+Qr)*Snhp3-(Qin+Qap+Qr)*Snhp4)+reac10;
dSndp4 = 1.0/V4*((Qin+Qap+Qr)*Sndp3-(Qin+Qap+Qr)*Sndp4)+reac11;
dXndp4 = 1.0/V4*((Qin+Qap+Qr)*Xndp3-(Qin+Qap+Qr)*Xndp4)+reac12;

