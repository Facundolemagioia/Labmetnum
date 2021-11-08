%%%%%%%%% PENDULO RESORTE - RK
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
Dt = 0.1;
tmax = 50;
rango = 0:Dt:tmax;
%
ur=[ur0];
vr=[vr0];
ua=[ua0];
va=[va0];
%
for i = rango
  ar0 = ar(MP,ur0,ua0,va0);     %%%
  aa0 = aa(MP,ur0,vr0,ua0,va0); %%%
%
  ur1 = ur0 + (1/2)*Dt*vr0;
  ua1 = ua0 + (1/2)*Dt*va0;
  vr1 = vr0 + (1/2)*Dt*ar0;
  va1 = va0 + (1/2)*Dt*aa0;
  ar1 = ar(MP,ur1,ua1,va1); %%%
  aa1 = aa(MP,ur1,vr1,ua1,va1); %%%
%
  ur2 = ur0 +    1*Dt*vr0 + 1*Dt^2*ar0;
  ua2 = ua0 +    1*Dt*va0 + 1*Dt^2*aa0;
  vr2 = vr0 + (-1)*Dt*ar0 + 2*Dt*ar1;
  va2 = va0 + (-1)*Dt*aa0 + 2*Dt*aa1;
  ar2 = ar(MP,ur2,ua2,va2);
  aa2 = aa(MP,ur2,vr2,ua2,va2);
%

%u3 = u0 + Dt*v0 + (1/6)*(Dt^2)*a0 + (1/3)*(Dt^2)*a1;
  ur3 = ur0 +       Dt*vr0 +  (1/6)*(Dt^2)*ar0 + (1/3)*(Dt^2)*ar1;
  ua3 = ua0 +       Dt*va0 +  (1/6)*(Dt^2)*aa0 + (1/3)*(Dt^2)*aa1;
  vr3 = vr0 + (1/6)*Dt*ar0 + (2/3)*Dt*ar1 + (1/6)*Dt*ar2;
  va3 = va0 + (1/6)*Dt*aa0 + (2/3)*Dt*aa1 + (1/6)*Dt*aa2;
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
plot(ua)
%plot(ur.*sin(ua),ur.*cos(ua))
