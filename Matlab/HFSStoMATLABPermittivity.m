%% Contants
s = 5e-4;                                                   %[m2]   Capacitor plates surface
d = 5e-3;                                                   %[m]    Distance between plates  
eps_0 = 8.85e-12;                                           %[F/b]  Vacuum Permittivity 

%% Select directory input
% If yoy want to extract permittivity from vacuum, with e-colli cell, or
% another. Enter de directory where are the 
% var = inputdlg('Please enter variable name:');
% load(var{1})
%% Load variables

% load('imY.mat');
% load('reY.mat');
% load('Freq.mat')
f = FreqHz;                                               %[Hz]   Frequency
w = 2*pi.*f;                                                %[rad/seg]  Angular Frequency
%% Computations
% Free space capaciance computation
Co = (eps_0*s)/d;

%Admitance calculation
%Y = reY11 + 1i*imY;

%Impedance calculation
Z = reZ11 + 1i*imZ11;

R = real(Z);
X = -imag(Z);

Y = 1./Z;
%Permittivity's computation 
eps = 1i*(Y./(w.*Co));

eps_real = real(eps)./eps_0;
eps_imag = -imag(eps)./eps_0;

%Permittivity plot
figure('Name', 'Real and Imaginary Permittity');
loglog(f, eps_real,  'Color', 'g');
hold on
loglog(f,eps_imag, 'Color', 'b');

%Impedance plot

figure('Name', 'R and X from Impedance');

loglog(f, R, 'Color', 'y');
ylabel( 'ylabel', 'resistance');
hold on
loglog(f, X, 'Color', 'r');
legend('X(f)');

hold on