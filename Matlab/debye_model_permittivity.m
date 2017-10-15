%Contants and variables

eps_0 = 8.85e-12;               %[F/m]      Free space permittivity
d = 0.5e-3;                     %[m]        Distance between plates
S = 0.0005;                     %[m2]       Plate surface
f = 0.01:0.1:30000000;          %[Hz]       Frequency range
eps_infinite = 80*eps_0;        %           Permittivity at upper frequency
eps_static = 1.9e7*eps_0;       %           Permittivity at DC
conductivity = 15e-6;           %[S/m]      Conducttivity
T=0.9;                          %[s]        Relaxing time
w = 2*pi.*f;                    %[rad/s]    Angular frequency

%% Permittivity
%Debye model 
a = (eps_static - eps_infinite)./(1+1i*w*T);
b = 1i*conductivity./w;
eps = (eps_infinite + a - b);

eps_real = real(eps);
eps_imag = -imag(eps);
eps_real_norm = eps_real/eps_0;
eps_imag_norm = eps_imag/eps_0;

%% Option 1
% % c = (eps_real.*eps_real)+(eps_imag.*eps_imag);
% % 
% % R = (1./w).*(eps_imag/c).*(d/S);
% % X = -(1./w).*(eps_real/c).*(d/S);
% % 


%% Option 2 <-- CORRECT
C = eps*d/S;
Z = 1./(w.*C);

R = real(Z);
X = imag(Z);

%% Representation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name', 'R(f) and X(f)');
loglog(f,R);
hold on
loglog(f,X);

figure('Name', 'Permittivity (Real and Imaginary)');
loglog(f,eps_real_norm);
hold on
loglog(f,eps_imag_norm);
