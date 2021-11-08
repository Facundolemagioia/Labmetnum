%%%%%%%%% PENDULO RESORTE - RK - EXP
Lo  = 0.5;
g   = 9.81;
ksm = 98.1;
MP = [Lo,g,ksm]; %%% Matriz de parámetros
[ur0, vr0, ua0, va0] = deal(0.25, 0, pi/2, 0); %% Valores iniciales
%
function [res] = ar(MP,ur,ua,va)
  Lo  = MP(1);
  g   = MP(2);
  ksm = MP(3);
  res = (Lo+ur)*va^2 +g*cos(ua) -ksm*ur;
endfunction
%
function [res] = aa(MP,ur,vr,ua,va)
  Lo  = MP(1);
  g   = MP(2);
  res = -(2*vr*va +g*sin(ua))/(Lo+ur);
endfunction
%
Dt = 0.001;
tmax = 50;
rango = 0:Dt:tmax;
%
ur=[ur0];
vr=[vr0];
ua=[ua0];
va=[va0];
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
  t2 =   1;
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
  ar0 = ar(MP,ur0,ua0,va0);     %%%
  aa0 = aa(MP,ur0,vr0,ua0,va0); %%%
%
  ur1 = ur0 + p12*Dt*vr0 + (t1*Dt)^2*a11/2*ar0; %%%
  ua1 = ua0 + p12*Dt*va0 + (t1*Dt)^2*a11/2*aa0; %%%
  vr1 = vr0 + p12*Dt*ar0; %%%
  va1 = va0 + p12*Dt*aa0; %%%
  ar1 = ar(MP,ur1,ua1,va1); %%%
  aa1 = aa(MP,ur1,vr1,ua1,va1); %%%
%
  ur2 = ur0 + u2v0*Dt*vr0 + (t2*Dt)^2*(u2a0*ar0 + a22/2*ar1); %%%
  ua2 = ua0 + u2v0*Dt*va0 + (t2*Dt)^2*(u2a0*aa0 + a22/2*aa1); %%%
  vr2 = vr0 +  p22*Dt*ar0 + p23*Dt*ar1; %%%
  va2 = va0 +  p22*Dt*aa0 + p23*Dt*aa1; %%%
  ar2 = ar(MP,ur2,ua2,va2);
  aa2 = aa(MP,ur2,vr2,ua2,va2);
%
  ur3 = ur0 + u3v0*Dt*vr0 + Dt^2*(u3a0*ar0 + u3a1*ar1 + a33/2*ar2);
  ua3 = ua0 + u3v0*Dt*va0 + Dt^2*(u3a0*aa0 + u3a1*aa1 + a33/2*aa2);
  vr3 = vr0 + p32*Dt*ar0 + p33*Dt*ar1 + p34*Dt*ar2;
  va3 = va0 + p32*Dt*aa0 + p33*Dt*aa1 + p34*Dt*aa2;
  %%%
%
   ur=[ur,ur3]; 
   vr=[vr,vr3];
   ua=[ua,ua3]; 
   va=[va,va3];
%
  ur0=ur3;
  ua0=ua3;
  vr0=vr3;
  va0=va3;
endfor
%plot(ua)
plot(ur.*sin(ua),ur.*cos(ua))
