
%% Parameters
muH = 4.0; Ks = 10.0; Koh = 0.2; Kno = 0.5; bh = 0.3; muA = 0.5; Knh = 1.0; Koa = 0.4;
ba = 0.05; ng = 0.8; ka = 0.05; kh = 3.0; Kx = 0.1; nh = 0.8; Yh = 0.67; Ya = 0.24;
fp = 0.08; ixb = 0.08; ixp = 0.06;
Sopsat = 8;

%% ProceSsp variables
V1 = 1000; V2 = 1000; V3 = 1333; V4 = 1333; V5 = 1333;

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
h1=dSsp1; h2=dXsp1; h3=dXbhp1; h4=dXbap1;
h5=dSop1; h6=dSnop1; h7=dSnhp1; h8=dSndp1; h9=dXndp1;

% Reactor2
constraintsReactor2
h10=dSsp2; h11=dXsp2; h12=dXbhp2; h13=dXbap2;
h14=dSop2; h15=dSnop2; h16=dSnhp2; h17=dSndp2; h18=dXndp2;

% Reactor3
constraintsReactor3
h19=dSsp3; h20=dXsp3; h21=dXbhp3; h22=dXbap3;
h23=dSop3; h24=dSnop3; h25=dSnhp3; h26=dSndp3; h27=dXndp3;

% Reactor4
constraintsReactor4
h28=dSsp4; h29=dXsp4; h30=dXbhp4; h31=dXbap4; 
h32=dSop4; h33=dSnop4; h34=dSnhp4; h35=dSndp4; h36=dXndp4;

% Reactor5
constraintsReactor5
h37=dSsp5; h38=dXsp5; h39=dXbhp5; h40=dXbap5;
h41=dSop5; h42=dSnop5; h43=dSnhp5; h44=dSndp5; h45=dXndp5;

% PI equations
kp1 = 2.94e+04; tauI1 = 0.00694;
dQap = kp1*(-dSnop2 + (1/tauI1)*(Snop2_sp -Snop2));
h46=dQap;

kp2 = 19.1; tauI2 = 0.0659;
dKLa = kp2*(-dSop5 + (1/tauI2)*(Sop5_sp-Sop5));
h47=dKLa;

ode = [h1; h2; h3; h4; h5; h6; h7; ...
    h8; h9; h10; h11; h12; h13; ...
    h14; h15; h16; h17; h18; h19; h20; ...
    h21; h22; h23; h24; h25; h26; h27;...
    h28; h29; h30; h31; h32; h33; h34; h35; ...
    h36; h37; h38; h39; h40; h41; ...
    h42; h43; h44; h45; h46; h47; 1];

