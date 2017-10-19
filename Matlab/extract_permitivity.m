s = 5e-4;                                                   %[m2]   Capacitor plates surface
d = 5e-3;                                                   %[m]    Distance between plates  
eps_0 = 8.85*10e-12;

%% Load variables
load('imY.mat');
load('reY.mat');
load('Freq.mat')
f = Freq*1e6;                                               %[Hz]   Frequency
w = 2*pi.*f;                                                %[rad/seg]  Angular Frequency
%% Computations
% Free space capaciance computation
Co = (eps_0*s)/d;

%Admitance calculation
Y = reY11 + 1i*imY;

%Impedance calculation
Z = 1./Y;

R = real(Z);
X = -imag(Z);

%Permittivity's computation 
eps = 1i*(Y./(w.*Co));

eps_real = real(eps)./eps_0;
eps_imag = -imag(eps)./eps_0;

%Permittivity plot
figure('Name', 'Real and Imaginary Permittity');
loglog(f, eps_real);
hold on
loglog(f,eps_imag);

%Impedance plot

figure('Name', 'R and X from Impedance');
loglog(f, R);
hold on
loglog(f, X);


