u0 = 1.5;
v0 = 0;
s1 = 100;
s2 = 10;
T = 0.15153;
Dt = T/32;
tmax = 50*T;
rango = [0:Dt:tmax];
%
u=[u0];
v=[v0];
a=[];
%
for i = rango
a0 = -s1*(1+s2*u0^2)*u0;% EC. 1
%
u1 = u0 + 1/3*Dt*v0 + 1/18*Dt^2*a0; % EC 2.1
v1 = v0 + 1/3*Dt*a0; % EC 2.2
a1 = -s1*(1+s2*u1^2)*u1;% EC 3
%
u2 = u0 + 1/2*Dt*v0 + 3/40*Dt^2*(2*a0/3 + a1); % EC 4.1
v2 = v0 + 1/8*Dt*a0 + 3/8*Dt*a1; % EC 4.2
a2 = -s1*(1+s2*u2^2)*u2; % EC 5
%
u3 = u0 + 1*Dt*v0 + 1/20*Dt^2*(a0 + 9*a1); % EC 6.1
v3 = v0 + 1/2*Dt*(a0 -3*a1 + 4*a2); % EC 6.2
a3 = -s1*(1+s2*u3^2)*u3; % EC 7
%
u4 = u0 + Dt*v0 + 1/6*Dt^2*(a0 + 2*a2); % EC 8.1
v4 = v0 + 1/6*Dt*(a0 + 4*a2 + a3); % EC 8.2
%
u=[u,u4];
v=[v,v4];
a=[a,a0];
u0=u4;
v0=v4;
endfor

plot(u,v)
