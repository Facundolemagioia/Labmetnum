u0 = 1.5;
v0 = 0;
s1 = 100;
s2 = 10;
T = 0.15153;
Dt = T/32;
tmax = 50*T;
%
u=[u0];
v=[v0];
a=[];
%
for i = 0:Dt:tmax
a0 = -s1*(1+s2*u0^2)*u0;
%
u1 = u0 + 1/3*Dt*v0 + 1/18*Dt^2*a0;
v1 = v0 + 1/3*Dt*a0;
a1 = -s1*(1+s2*u1^2)*u1;
%
u2 = u0 + 2/3*Dt*v0 + 1/27*Dt^2*(2*a0 + 4*a1);
v2 = v0 + 2/3*Dt*a1;
a2 = -s1*(1+s2*u2^2)*u2;
%
u3 = u0 + Dt*v0 + 1/6*Dt^2*(a0 + a1 + a2);
v3 = v0 + 1/4*Dt*(a0 + 3*a2);
%
if (i<=2*T)
  u=[u,u3];
  v=[v,v3];
  a=[a,a0];
endif
u0=u3;
v0=v3;
endfor

subplot (3, 1, 1)
plot (u);
subplot (3, 1, 2)
plot (v);
subplot (3, 1, 3)
plot (a);
