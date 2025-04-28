%% ProceSspes involved
proc1 = muH*(Ssp3/(Ks+Ssp3))*(Sop3/(Koh+Sop3))*Xbhp3;
proc2 = muH*(Ssp3/(Ks+Ssp3))*(Koh/(Koh+Sop3))*(Snop3/(Kno+Snop3))*ng*Xbhp3;
proc3 = muA*(Snhp3/(Knh+Snhp3))*(Sop3/(Koa+Sop3))*Xbap3;
proc4 = bh*Xbhp3;
proc5 = ba*Xbap3;
proc6 = ka*Sndp3*Xbhp3;
proc7 = kh*((Xsp3/Xbhp3)/(Kx+(Xsp3/Xbhp3)))*((Sop3/(Koh+Sop3))+nh*(Koh/(Koh+Sop3))*(Snop3/(Kno+Snop3)))*Xbhp3;
proc8 = proc7*Xndp3/Xsp3;

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
dSsp3 = 1.0/V3*((Qin+Qap+Qr)*Ssp2-(Qin+Qap+Qr)*Ssp3)+reac2;
dXsp3 = 1.0/V3*((Qin+Qap+Qr)*Xsp2-(Qin+Qap+Qr)*Xsp3)+reac4;
dXbhp3 = 1.0/V3*((Qin+Qap+Qr)*Xbhp2-(Qin+Qap+Qr)*Xbhp3)+reac5;
dXbap3 = 1.0/V3*((Qin+Qap+Qr)*Xbap2-(Qin+Qap+Qr)*Xbap3)+reac6;
dSop3 = 1.0/V3*((Qin+Qap+Qr)*Sop2-(Qin+Qap+Qr)*Sop3)+reac8+240*(Sopsat-Sop3);
dSnop3 = 1.0/V3*((Qin+Qap+Qr)*Snop2-(Qin+Qap+Qr)*Snop3)+reac9;
dSnhp3 = 1.0/V3*((Qin+Qap+Qr)*Snhp2-(Qin+Qap+Qr)*Snhp3)+reac10;
dSndp3 = 1.0/V3*((Qin+Qap+Qr)*Sndp2-(Qin+Qap+Qr)*Sndp3)+reac11;
dXndp3 = 1.0/V3*((Qin+Qap+Qr)*Xndp2-(Qin+Qap+Qr)*Xndp3)+reac12;

