close all

%% Coaxial phisic parameters
% Frequency range
f_min=1e4;                  %[Hz]       10kHz
f_max=3e9;                  %[Hz]       1GHz
N_f=101;
freq = logspace(log10(f_min),log10(f_max),N_f);
w = 2*pi.*freq;





%% TEM waves coaxial propagation
eps_rea_vac = 1;
sgm_vac = 0;

eps_rea_wat = 81;
sgm_wat = 0.002;

eps_rea_sea = 81;
sgm_sea = 4;

%Vacuum
[S21_vac, phs_vac] = S21(eps_rea_vac, sgm_vac, w);
figure('Name', 'S21 Vacuum');
plot(freq, S21_vac);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Distilled Water
[S21_wat, phs_wat] = S21(eps_rea_wat,sgm_wat,w);
figure ('Name', 'S21 Distilled Water');
plot(freq, S21_wat);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Water Sea
[S21_sea, phs_sea] = S21(eps_rea_sea,sgm_sea,w);
figure ('Name', 'S21 Sea Water');
plot(freq, S21_sea);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium without cells
[S21_cul_0, phs_cul_0] = S21(eps_rea_cul_0,sgm_cul_0,w);
figure('Name', 'S21 Culture Medium without cells'); 
plot(freq,S21_cul_0);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium with cells
[S21_cul, phs_cul] = S21(eps_rea_cul,sgm_cul,w);
figure('Name', 'S21 Culture Medium with 0.1 volum cell');
plot(freq,S21_cul);xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label


%% Sensitivitys Plots

figure('Name', 'Sensitivity Vacuum - Culture Medium withour cells');
dif_cul_0_vac = abs(S21_cul_0 - S21_vac);
plot(freq, dif_cul_0_vac);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label

figure('Name', 'Sensitivity Vacuum - Culture Medium (P=0.1)'); 
dif_cul_vac = abs(S21_cul - S21_vac);
plot(freq,dif_cul_vac);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label

figure('Name', 'Sensitivity Vacuum - Destilled Water'); 
dif_vac_wat = abs(S21_vac - S21_wat);
plot(freq,dif_vac_wat);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label

figure('Name', 'Sensitivity Vacuum - Sea Water'); 
dif_vac_sea = abs(S21_vac - S21_sea);
plot(freq,dif_vac_sea);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label

figure('Name', 'Sensitivity Culture Medium without cells - Destilled Water'); 
dif_cul_0_wat = abs(S21_cul_0 - S21_wat);
plot(freq, dif_cul_0_wat);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label

figure('Name', 'Sensitivity Culture Medium without cells - Sea Water');
dif_cul_0_sea = abs(S21_cul_0 - S21_sea);
plot(freq, dif_cul_0_sea);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label

figure('Name', 'Sensitivity Culture Medium without cells - Culture Medium P=0.1');
dif_cul_0_cul = abs(S21_cul_0 - S21_cul);
plot(freq, dif_cul_0_cul);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label

figure('Name', 'Sensitivity Culture Medium with cells - Destilled Water'); 
dif_cul_wat = abs(S21_cul - S21_wat);
plot(freq, dif_cul_wat);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label

figure('Name', 'Sensitivity Culture Medium with cells - Sea Water');
dif_cul_sea = abs(S21_cul - S21_sea);
plot(freq, dif_cul_sea);
xlabel('Frequency in Hz') % x-axis label
ylabel('|?S21|') % y-axis label





%% Functions

function [S21_modul, S21_fase] = S21( eps_rea, sgm, w)
% w : angular frequency [rad/s]
% c : light speed 3e8 [m/s]
% z : thickness (3e-3 [m] )
z = 3e-3;
c = 3e8; 	
b = w.*(sqrt(eps_rea))/c;                              % beta
a= 60*pi*sgm./sqrt(eps_rea);                           % alfa
S21_cmx = exp(-1i.*b.*z).*exp(-a.*z);                      % S parameter (2->1)
S21_modul = abs(S21_cmx);                                  % [W]
S21_fase = angle(S21_cmx);                                 % [rad]


end

function [ output_lineal ] = dB_to_lineal( input_dB )

output_lineal = 10.^(input_dB./10);

end

function [ r_coa ] = coaxial_geometry( r_cob, z_cox )
%UNTITLED4 Summary of this function goes here
%r_cob [mm] radi ext coaxial
%z_cox [ohms] vacuum impedance
r_coa = r_cob/(exp(z_cox/60));

end
