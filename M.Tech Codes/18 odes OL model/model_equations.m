
%% Parameters
muH = 4.0; Ks = 10.0; Koh = 0.2; Kno = 0.5; bh = 0.3; muA = 0.5; Knh = 1.0; Koa = 0.4;
ba = 0.05; ng = 0.8; ka = 0.05; kh = 3.0; Kx = 0.1; nh = 0.8; Yh = 0.67; Ya = 0.24;
fp = 0.08; ixb = 0.08; ixp = 0.06;
Sopsat = 8;

%% ProceSsp variables
V1 = 2*1000; V2 = 4*1000;

%% Influent conditions
Ssin = 69.5;
Xsin = 202.32;
Xbhin = 28.17;
Xbain = 0;
Soin = 0;
Snoin = 0;
Snhin = 31.56;
Sndin = 6.95;
Xndin = 10.59;
Qin = 18446;

%% Recycle factor
Qr = 18446;
Qw = 385;
factor = (Qin+Qr)/(Qr+Qw);

%% Non-linear model equations as equality constraints
% Reactor1
constraintsReactor1
h1=dSs1; h2=dXs1; h3=dXbh1; h4=dXba1;
h5=dSo1; h6=dSno1; h7=dSnh1; h8=dSnd1; h9=dXnd1;

% Reactor2
constraintsReactor2
h10=dSs2; h11=dXs2; h12=dXbh2; h13=dXba2;
h14=dSo2; h15=dSno2; h16=dSnh2; h17=dSnd2; h18=dXnd2;

ode = [h1; h2; h3; h4; h5; h6; h7; ...
    h8; h9; h10; h11; h12; h13; ...
    h14; h15; h16; h17; h18; 1];

