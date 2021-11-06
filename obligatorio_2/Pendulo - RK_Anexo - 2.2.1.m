% valores pendulo
u0 = 0;
v0 = 1.9999;
wc = 1;
T = 33.7210;
Dt = T/50000;
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
  u1 = u0 + (1/2)*Dt*v0;
  v1 = v0 + (1/2)*Dt*a0;
  
  a1 = -wc*sin(u1);
%
  u2 = u0 + (-3)*Dt*v0 + 8*Dt*v1;
  v2 = v0 + (-3)*Dt*a1 + 8*Dt*a1;
  
  a2 = -wc*sin(u2);
%
  u3 = u0 + (1/6)*Dt*v0 + (2/3)*Dt*v1 + (1/6)*Dt*v2;
  v3 = v0 + (1/6)*Dt*a0 + (2/3)*Dt*a1 + (1/6)*Dt*a2;
%
   u=[u,u3]; 
   v=[v,v3];
   a=[a,a0];
%
  u0=u3;
  v0=v3;
endfor

plot (rango,u(1:(length(u)-1)));
