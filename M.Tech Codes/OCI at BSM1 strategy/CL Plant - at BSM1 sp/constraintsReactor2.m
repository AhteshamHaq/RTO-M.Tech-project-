% Reactor 2
%% ProceSspes involved
proc1 = muH*(Ssp2/(Ks+Ssp2))*(Sop2/(Koh+Sop2))*Xbhp2;
proc2 = muH*(Ssp2/(Ks+Ssp2))*(Koh/(Koh+Sop2))*(Snop2/(Kno+Snop2))*ng*Xbhp2;
proc3 = muA*(Snhp2/(Knh+Snhp2))*(Sop2/(Koa+Sop2))*Xbap2;
proc4 = bh*Xbhp2;
proc5 = ba*Xbap2;
proc6 = ka*Sndp2*Xbhp2;
proc7 = kh*((Xsp2/Xbhp2)/(Kx+(Xsp2/Xbhp2)))*((Sop2/(Koh+Sop2))+nh*(Koh/(Koh+Sop2))*(Snop2/(Kno+Snop2)))*Xbhp2;
proc8 = proc7*Xndp2/Xsp2;

%% Reactions for each state
reac2 = (-proc1-proc2)/Yh+proc7;                        %2. Ssp
reac4 = (1.0-fp)*(proc4+proc5)-proc7;                   %4. Xsp
reac5 = proc1+proc2-proc4;                              %5. Xbhp
reac6 = proc3-proc5;                                    %6. Xbap
reac8 = -((1.0-Yh)/Yh)*proc1-((4.57-Ya)/Ya)*proc3;      %8. Sop
reac9 = -((1.0-Yh)/(2.86*Yh))*proc2+proc3/Ya;           %9. Snop
reac10 = -ixb*(proc1+proc2)-(ixb+(1.0/Ya))*proc3+proc6; %10. Snhp
reac11 = -proc6+proc8;                                  %11. Sndp
reac12 = (ixb-fp*ixp)*(proc4+proc5)-proc8;              %12. Xndp

%% MaSsp balance equations
dSsp2 = 1.0/V2*((Qin+Qap+Qr)*Ssp1-(Qin+Qap+Qr)*Ssp2)+reac2;
dXsp2 = 1.0/V2*((Qin+Qap+Qr)*Xsp1-(Qin+Qap+Qr)*Xsp2)+reac4;
dXbhp2 = 1.0/V2*((Qin+Qap+Qr)*Xbhp1-(Qin+Qap+Qr)*Xbhp2)+reac5;
dXbap2 = 1.0/V2*((Qin+Qap+Qr)*Xbap1-(Qin+Qap+Qr)*Xbap2)+reac6;
dSop2 = 1.0/V2*((Qin+Qap+Qr)*Sop1-(Qin+Qap+Qr)*Sop2)+reac8; %+KLap*(Sopsat-Sop2);
dSnop2 = 1.0/V2*((Qin+Qap+Qr)*Snop1-(Qin+Qap+Qr)*Snop2)+reac9;
dSnhp2 = 1.0/V2*((Qin+Qap+Qr)*Snhp1-(Qin+Qap+Qr)*Snhp2)+reac10;
dSndp2 = 1.0/V2*((Qin+Qap+Qr)*Sndp1-(Qin+Qap+Qr)*Sndp2)+reac11;
dXndp2 = 1.0/V2*((Qin+Qap+Qr)*Xndp1-(Qin+Qap+Qr)*Xndp2)+reac12;
