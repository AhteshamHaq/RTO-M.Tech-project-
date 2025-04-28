% Reactor 1
%% ProceSspes involved
proc1 = muH*(Ssp1/(Ks+Ssp1))*(Sop1/(Koh+Sop1))*Xbhp1;
proc2 = muH*(Ssp1/(Ks+Ssp1))*(Koh/(Koh+Sop1))*(Snop1/(Kno+Snop1))*ng*Xbhp1;
proc3 = muA*(Snhp1/(Knh+Snhp1))*(Sop1/(Koa+Sop1))*Xbap1;
proc4 = bh*Xbhp1;
proc5 = ba*Xbap1;
proc6 = ka*Sndp1*Xbhp1;
proc7 = kh*((Xsp1/Xbhp1)/(Kx+(Xsp1/Xbhp1)))*((Sop1/(Koh+Sop1))+nh*(Koh/(Koh+Sop1))*(Snop1/(Kno+Snop1)))*Xbhp1;
proc8 = proc7*Xndp1/Xsp1;

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
dSsp1 = 1.0/V1*(Qin*Ssin+(Qap+Qr)*Ssp5-(Qin+Qap+Qr)*Ssp1)+reac2;
dXsp1 = 1.0/V1*(Qin*Xsin+(Qap+Qr*factor)*Xsp5-(Qin+Qap+Qr)*Xsp1)+reac4;
dXbhp1 = 1.0/V1*(Qin*Xbhin+(Qap+Qr*factor)*Xbhp5-(Qin+Qap+Qr)*Xbhp1)+reac5;
dXbap1 = 1.0/V1*(Qin*Xbain+(Qap+Qr*factor)*Xbap5-(Qin+Qap+Qr)*Xbap1)+reac6;
dSop1 = 1.0/V1*(Qin*Soin+(Qap+Qr)*Sop5-(Qin+Qap+Qr)*Sop1)+reac8; %+KLap*(Sopsat-Sop1);
dSnop1 = 1.0/V1*(Qin*Snoin+(Qap+Qr)*Snop5-(Qin+Qap+Qr)*Snop1)+reac9;
dSnhp1 = 1.0/V1*(Qin*Snhin+(Qap+Qr)*Snhp5-(Qin+Qap+Qr)*Snhp1)+reac10;
dSndp1 = 1.0/V1*(Qin*Sndin+(Qap+Qr)*Sndp5-(Qin+Qap+Qr)*Sndp1)+reac11;
dXndp1 = 1.0/V1*(Qin*Xndin+(Qap+Qr*factor)*Xndp5-(Qin+Qap+Qr)*Xndp1)+reac12;

