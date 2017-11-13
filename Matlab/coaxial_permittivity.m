
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

%Culture Medium with P= 0.1 cells
[S21_cul_01, phs_cul_01] = S21(eps_rea_cul,sgm_cul,w);
figure('Name', 'S21 Culture Medium with 0.1 volum cell');
plot(freq,S21_cul_01);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium with P= 0.05 cells
[S21_cul_05, phs_cul_05] = S21(eps_rea_cul_05,sgm_cul_05,w);
figure('Name', 'S21 Culture Medium with 0.05 volum cell');
plot(freq,S21_cul_05);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium with P= 0.025 cells
[S21_cul_025, phs_cul_025] = S21(eps_rea_cul_025,sgm_cul_025,w);
figure('Name', 'S21 Culture Medium with 0.025 volum cell');
plot(freq,S21_cul_025);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium with P= 0.0125 cells
[S21_cul_0125, phs_cul_0125] = S21(eps_rea_cul_0125,sgm_cul_0125,w);
figure('Name', 'S21 Culture Medium with 0.0125 volum cell');
plot(freq,S21_cul_0125);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%% Sensitivitys Plots 7

%Definiendo la sensibilidad como la relacion entre amplitudes de la
%potencia transmitida en dinstintos medios, es decir, la division de
%amplitudes.

figure


dif_cul_0_vac = (S21_cul_0 ./ S21_vac);
plot(freq, dif_cul_0_vac);
hold on
dif_cul_vac = (S21_cul_01 ./ S21_vac);
plot(freq,dif_cul_vac);
hold on
dif_vac_wat = (S21_wat ./ S21_vac);
plot(freq,dif_vac_wat);
hold on
dif_vac_sea = (S21_sea ./ S21_vac );
plot(freq,dif_vac_sea);
hold on
dif_cul_0_wat = (S21_wat ./ S21_cul_0);
plot(freq, dif_cul_0_wat);
hold on
dif_cul_0_sea = ( S21_sea ./  S21_cul_0);
plot(freq, dif_cul_0_sea);
hold on
dif_cul_0_cul = (S21_cul_01 ./  S21_cul_0);
plot(freq, dif_cul_0_cul);
hold on
dif_cul_wat = (S21_cul_01 ./  S21_wat);
plot(freq, dif_cul_wat);
hold on
dif_cul_sea = ( S21_sea ./  S21_cul_01);
plot(freq, dif_cul_sea);
hold on 
title('Sensitivity S21_a / S21_b');
legend('|S21_c_0 / S21_v|', '|S21_c / S21_v|', '|S21_v / S21_w|', '|S21_s / S21_v|', '|S21_w / S21_c_0|', '|S21_s / S21_c_0|', '|S21_c / S21_c_0|', '|S21_c / S21_w|', '|S21_s / S21_c|');
xlabel('Frequency (Hz)') % x-axis label
ylabel('|S21a / S21b|') % y-axis label


% definiendo la sesibilidad como la diferencia entre amplitudes de la
% potencia transmitida en distintos medios

figure

dif_cul_0_vac = (S21_cul_0 - S21_vac);
plot(freq, dif_cul_0_vac);
hold on

dif_cul_vac = (S21_cul_01 - S21_vac);
plot(freq,dif_cul_vac);
hold on


dif_vac_wat = (S21_vac - S21_wat);
plot(freq,dif_vac_wat);
hold on


dif_vac_sea = (S21_vac - S21_sea);
plot(freq,dif_vac_sea);
hold on

dif_cul_0_wat = (S21_wat - S21_cul_0);
plot(freq, dif_cul_0_wat);
hold on

dif_cul_0_sea = (S21_cul_0 - S21_sea);
plot(freq, dif_cul_0_sea);
hold on

dif_cul_0_cul = (S21_cul_0 - S21_cul_01);
plot(freq, dif_cul_0_cul);
hold on
 
dif_cul_wat = (S21_wat - S21_cul_01);
plot(freq, dif_cul_wat);
hold on

dif_cul_sea = (S21_cul_01 - S21_sea);
plot(freq, dif_cul_sea);
hold on
xlabel('Frequency (Hz)') % x-axis label
ylabel('|S21_a - S21_b|') % y-axis label
title('Sensitivity S21_a - S21_b');
legend('|S21_c_0 - S21_v|','|S21_c - S21_v|', '|S21_v - S21_w|', '|S21_v - S21_s|', '|S21_w - S21_c_0|','|S21_c_0 - S21_s|', '|S21_c_0 - S21_c|', '|S21_c - S21_w|', '|S21_c - S21_s|');   


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

%r_cob [mm] radi ext coaxial
%z_cox [ohms] vacuum impedance
r_coa = r_cob/(exp(z_cox/60));

end
