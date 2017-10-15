%Contants and variables

eps_0 = 8.85e-12;   % [F/m] Free space permittivity
d = 0.5e-3;         %   [m] distance between plates
S = 0.0005;          %   [m2] plate surface
f = 0.01:0.1:30000000; %[Hz] frequency range
eps_infinite = 80*eps_0;    % Permittivity at upper frequency
eps_static = 1.9e7*eps_0;   % Permittivity at DC
conductivity = 15e-6;   %[S/m]  
T=0.9; %[s]             Relaxing time
w = 2*pi.*f; %[rad/s]

%% Formulas
a = (eps_static - eps_infinite)./(1+1i*w*T);
b = 1i*conductivity./w;
eps = (eps_infinite + a - b);

eps_real = real(eps);
eps_imag = imag(eps);

c = (eps_static.*eps_static)+(eps_imag.*eps_imag);

R = (1./w).*(eps_imag/c).*(d/S);
X = -(1./w).*(eps_real/c).*(d/S);

eps_real_norm = eps_real/eps_0;
eps_imag_norm = eps_imag/eps_0;

%% Representation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure ('Name', 'R(f) sin logaritmico');
plot(f,R);
%%
figure('Name', 'R(f) and X(f)');
loglog(f,R);
hold on
loglog(f,X);
%%
figure('Name', 'Permittivity (Real and Imaginary)');
loglog(f,eps_real_norm);
hold on
loglog(f,eps_imag_norm);
%%
figure ('Name', 'R(f) semilogaritmico');
semilogx(f,R);

%%
figure('Name', 'R(f) semilog eje y');
semilogy(f,R);

%%
figure ('Name', 'R(f) logaritmico');
loglog(f,R);
