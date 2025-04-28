% Reactor 2
%% ProceSspes involved
proc1 = muH*(Ss2/(Ks+Ss2))*(So2/(Koh+So2))*Xbh2;
proc2 = muH*(Ss2/(Ks+Ss2))*(Koh/(Koh+So2))*(Sno2/(Kno+Sno2))*ng*Xbh2;
proc3 = muA*(Snh2/(Knh+Snh2))*(So2/(Koa+So2))*Xba2;
proc4 = bh*Xbh2;
proc5 = ba*Xba2;
proc6 = ka*Snd2*Xbh2;
proc7 = kh*((Xs2/Xbh2)/(Kx+(Xs2/Xbh2)))*((So2/(Koh+So2))+nh*(Koh/(Koh+So2))*(Sno2/(Kno+Sno2)))*Xbh2;
proc8 = proc7*Xnd2/Xs2;

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
dSs2 = 1.0/V2*((Qin+Qa+Qr)*Ss1-(Qin+Qa+Qr)*Ss2)+reac2;
dXs2 = 1.0/V2*((Qin+Qa+Qr)*Xs1-(Qin+Qa+Qr)*Xs2)+reac4;
dXbh2 = 1.0/V2*((Qin+Qa+Qr)*Xbh1-(Qin+Qa+Qr)*Xbh2)+reac5;
dXba2 = 1.0/V2*((Qin+Qa+Qr)*Xba1-(Qin+Qa+Qr)*Xba2)+reac6;
dSo2 = 1.0/V2*((Qin+Qa+Qr)*So1-(Qin+Qa+Qr)*So2)+reac8 + KLa*(Sosat-So2);
dSno2 = 1.0/V2*((Qin+Qa+Qr)*Sno1-(Qin+Qa+Qr)*Sno2)+reac9;
dSnh2 = 1.0/V2*((Qin+Qa+Qr)*Snh1-(Qin+Qa+Qr)*Snh2)+reac10;
dSnd2 = 1.0/V2*((Qin+Qa+Qr)*Snd1-(Qin+Qa+Qr)*Snd2)+reac11;
dXnd2 = 1.0/V2*((Qin+Qa+Qr)*Xnd1-(Qin+Qa+Qr)*Xnd2)+reac12;
