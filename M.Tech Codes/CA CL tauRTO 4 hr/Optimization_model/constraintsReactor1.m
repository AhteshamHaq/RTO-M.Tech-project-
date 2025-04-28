% Reactor 1
%% ProceSspes involved
proc1 = muH*(Ss1/(Ks+Ss1))*(So1/(Koh+So1))*Xbh1;
proc2 = muH*(Ss1/(Ks+Ss1))*(Koh/(Koh+So1))*(Sno1/(Kno+Sno1))*ng*Xbh1;
proc3 = muA*(Snh1/(Knh+Snh1))*(So1/(Koa+So1))*Xba1;
proc4 = bh*Xbh1;
proc5 = ba*Xba1;
proc6 = ka*Snd1*Xbh1;
proc7 = kh*((Xs1/Xbh1)/(Kx+(Xs1/Xbh1)))*((So1/(Koh+So1))+nh*(Koh/(Koh+So1))*(Sno1/(Kno+Sno1)))*Xbh1;
proc8 = proc7*Xnd1/Xs1;

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
dSs1 = 1.0/V1*(Qin*Ssin+(Qa+Qr)*Ss2-(Qin+Qa+Qr)*Ss1)+reac2;
dXs1 = 1.0/V1*(Qin*Xsin+(Qa+Qr*factor)*Xs2-(Qin+Qa+Qr)*Xs1)+reac4;
dXbh1 = 1.0/V1*(Qin*Xbhin+(Qa+Qr*factor)*Xbh2-(Qin+Qa+Qr)*Xbh1)+reac5;
dXba1 = 1.0/V1*(Qin*Xbain+(Qa+Qr*factor)*Xba2-(Qin+Qa+Qr)*Xba1)+reac6;
dSo1 = 1.0/V1*(Qin*Soin+(Qa+Qr)*So2-(Qin+Qa+Qr)*So1)+reac8; %+KLa*(Sopsat-So1);
dSno1 = 1.0/V1*(Qin*Snoin+(Qa+Qr)*Sno2-(Qin+Qa+Qr)*Sno1)+reac9;
dSnh1 = 1.0/V1*(Qin*Snhin+(Qa+Qr)*Snh2-(Qin+Qa+Qr)*Snh1)+reac10;
dSnd1 = 1.0/V1*(Qin*Sndin+(Qa+Qr)*Snd2-(Qin+Qa+Qr)*Snd1)+reac11;
dXnd1 = 1.0/V1*(Qin*Xndin+(Qa+Qr*factor)*Xnd2-(Qin+Qa+Qr)*Xnd1)+reac12;

