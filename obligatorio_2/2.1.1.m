
u0 = 1.5;
v0 = 0;
s1 = 100;
s2 = 10;
T = 0.15153;
Dt = T/32;
tmax = 50*T;
tt = 0:Dt:tmax;

%RK3

f1 = @(t,u,z) z;
f2 = @(t,u,z) -s1*(1 + s2*(u^2))*u;

u = zeros(length(tt),1);
z = zeros(length(tt),1);
u(1) = u0;
z(1) = v0; 


for i = 1:1600
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
plot(u,z);
