
g = 1;
L = 1;
w = sqrt(g/L);

% en este caso es la funcion Theta
u0 = 0;
v0 = 1,9999;

T = 33.7210;
Dt = T/400;
tmax = 3*T;
tt = 0:Dt:tmax;

%RK3

f1 = @(t,u,z) z;
f2 = @(t,u,z) -(w^2)*(sin(u));

u = zeros(length(tt),1);
z = zeros(length(tt),1);
u(1) = u0;
z(1) = v0; 


for i = 1:1200
  K1u = f1(tt(i), u(i), z(i));
  K1z = f2(tt(i), u(i), z(i));
  
  K2u = f1(tt(i) + Dt/2, u(i) + Dt*K1u/2, z(i)+ Dt*K1z/2);
  K2z = f2(tt(i) + Dt/2, u(i) + Dt*K1u/2, z(i)+ Dt*K1z/2);
  
  K3u = f1(tt(i) + Dt, u(i) + Dt*(-K1u + 2*K2u), z(i) + Dt*(-K1z + 2*K2z));
  K3z = f2(tt(i) + Dt, u(i) + Dt*(-K1u + 2*K2u), z(i) + Dt*(-K1z + 2*K2z));
  
  
  u(i+1) = u(i) + (Dt/6)*(K1u + 4*K2u + K3u);
  z(i+1) = z(i) + (Dt/6)*(K1z + 4*K2z + K3z);

  
endfor

%z es la velocidad
plot(tt,u);
