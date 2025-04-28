optBSM1.subject_to(0.5 == Sno1_sp );
optBSM1.subject_to(0.5 <= So2_sp  <= 5);
optBSM1.subject_to(  0 <= Snh2 <= 4 +m0G);


% optBSM1.subject_to(0.1 +m0G(1) +m1G(1)*([Qa;KLa]-uk) <= Sno2 <= 5 -m0G(4) -m1G(4)*([Qa;KLa]-uk));
% optBSM1.subject_to(0.5 +m0G(2) +m1G(2)*([Qa;KLa]-uk) <= So5  <= 5- m0G(5) -m1G(5)*([Qa;KLa]-uk));
% optBSM1.subject_to(  0 +m0G(3) +m1G(3)*([Qa;KLa]-uk) <= Snh5 <= 4- m0G(6) -m1G(6)*([Qa;KLa]-uk));
