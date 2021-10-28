u0 = 0;
v0 = 1.9999;
wc = 1;
T = 33.7210;
Dt = T/400;
tmax = 3*T;
rango = 0:Dt:tmax;
%
u=[u0];
v=[v0];
a=[];
%
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
v=[v,v3];
a=[a,a0];
u0=u3;
v0=v3;
endfor

plot (rango,u(1:(length(u)-1)));
