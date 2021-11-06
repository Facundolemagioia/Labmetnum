%%%%%%%%%%%%%%%%%% PENDULO - EXPERIMENTACION
u0 = 0;
v0 = 1.9999;
wc = 1;
T = 33.7210;
Dt = T/40000;
tmax = 3*T;
rango = 0:Dt:tmax;
%%%%%%%%%%%%%%%%%% RK
u0 = 0;
v0 = 1.9999;
u=[u0];
%
met = 1;
if (met == 0)
  t1 = 1/2;
  t2 = 1;
  a11 = 0;
  a21 = 0;
  a22 = 0;
  a31 = 0;
  a32 = 0;
  a33 = 0;
elseif (met == 1)
  t1 = 2/3;
  t2 = 1;
  a11 = 1;
  a21 = -2/3;
  a22 =  2/3;
  a31 =  1/3;
  a32 = -2/3;
  a33 =  1/3;
endif
p12 = t1;
p22 = -t2/t1*(t1+t2);
p23 = 4*t2^2/t1;
p32 = (2 - 3*t1 -3*t2 +6*t1*t2)/(6*t1*t2);
p33 = (2 -3*t2)/(6*t1*(t1-t2));
p34 = (3*t1 -2)/(6*t2*(t1-t2));
u2v0 = p22 + p23;
u2a0 = (p23*p12)/t2^2 + a21/2;
u3v0 = p32 + p33 + p34;
u3a0 = p12*p33 + p22*p34 + a31/2;
u3a1 = p23*p34 + a32/2;
%
for i = rango
  a0 = -wc*sin(u0);
%
  u1 = u0 + p12*Dt*v0 + (t1*Dt)^2*a11/2*a0; %%%
  v1 = v0 + p12*Dt*a0; %%%
  a1 = -wc*sin(u1);
%
  u2 = u0 + u2v0*Dt*v0 + (t2*Dt)^2*(u2a0*a0 + a22/2*a1); %%%
  v2 = v0 +  p22*Dt*a0 + p23*Dt*a1; %%%
  a2 = -wc*sin(u2);
%
  u3 = u0 + u3v0*Dt*v0 + Dt^2*(u3a0*a0 + u3a1*a1 + a33/2*a2);
  v3 = v0 + p32*Dt*a0 + p33*Dt*a1 + p34*Dt*a2;
%
  u=[u,u3]; 
%
  u0=u3;
  v0=v3;
endfor
urk=u(1:(length(u)-1));
%%%%%%%%%%%%%%%%%% M3
u0 = 0;
v0 = 1.9999;
u=[u0];
for i = rango
  a0 = -wc*sin(u0);
  %
  u1 = u0 + 1/3*Dt*v0 + 1/18*Dt^2*a0;
  v1 = v0 + 1/3*Dt*a0;
  a1 = -wc*sin(u1);
  %
  u2 = u0 + 2/3*Dt*v0 + 1/27*Dt^2*(2*a0 + 4*a1); % EC 23
  v2 = v0 + 2/3*Dt*a1;
  a2 = -wc*sin(u2);
  %
  u3 = u0 + Dt*v0 + 1/6*Dt^2*(a0 + a1 + a2); % EC 26
  v3 = v0 + 1/4*Dt*(a0 + 3*a2);
%
  u=[u,u3]; 
%
  u0=u3;
  v0=v3;
endfor
umet3=u(1:(length(u)-1));
%%%%%%%%%%%%%%%%%% M4
u0 = 0;
v0 = 1.9999;
u=[u0];
for i = rango
  a0 = -wc*sin(u0); % EC. 1
  %
  u1 = u0 + 1/3*Dt*v0 + 1/18*Dt^2*a0; % EC 2.1
  v1 = v0 + 1/3*Dt*a0; % EC 2.2
  a1 = -wc*sin(u1); % EC 3
  %
  u2 = u0 + 1/2*Dt*v0 + 3/40*Dt^2*(2*a0/3 + a1); % EC 4.1
  v2 = v0 + 1/8*Dt*a0 + 3/8*Dt*a1; % EC 4.2
  a2 = -wc*sin(u2); % EC 5
  %
  u3 = u0 + 1*Dt*v0 + 1/20*Dt^2*(a0 + 9*a1); % EC 6.1
  v3 = v0 + 1/2*Dt*(a0 -3*a1 + 4*a2); % EC 6.2
  a3 = -wc*sin(u3); % EC 7
  %
  u4 = u0 + Dt*v0 + 1/6*Dt^2*(a0 + 2*a2); % EC 8.1
  v4 = v0 + 1/6*Dt*(a0 + 4*a2 + a3); % EC 8.2
  %
  u=[u,u4];
  %
  u0=u4;
  v0=v4;
endfor
umet4=u(1:(length(u)-1));
%%%%%%%%%%%%%%%%%% GRAFICO
plot(rango,urk,"-r",rango,umet3,"-b",rango,umet4,"-g");
