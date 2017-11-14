
close all
load('permittivities_sgm.mat');

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

z = 10e-3;

%Vacuum
[S21_vac, phs_vac] = S21(eps_rea_vac, sgm_vac, w, z);
%[S11_vac] = S11(eps_cmx_vac);
figure('Name', 'S21 Vacuum');
plot(freq, S21_vac);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Distilled Water
[S21_wat, phs_wat] = S21(eps_rea_wat,sgm_wat,w, z);
%[S11_wat] = S11(eps_cmx_wat);
figure ('Name', 'S21 Distilled Water');
plot(freq, S21_wat);
hold on

xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Water Sea
[S21_sea, phs_sea] = S21(eps_rea_sea,sgm_sea,w, z);
%[S11_sea] = S11(eps_cmx_sea);
figure ('Name', 'S21 Sea Water');
plot(freq, S21_sea);
% hold on
% plot(freq, S11_sea);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium without cells
[S21_cul_0, phs_cul_0] = S21(eps_rea_cul_0,sgm_cul_0,w, z);
%[S11_cul_0] = S11(eps_cmx_cul_0);
figure('Name', 'S21 Culture Medium without cells'); 
plot(freq,S21_cul_0);
% hold on
% plot(freq, S11_cul_0);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium with P= 0.1 cells
[S21_cul_01, phs_cul_01] = S21(eps_rea_cul,sgm_cul,w, z);
figure('Name', 'S21 Culture Medium with 0.1 volum cell');
plot(freq,S21_cul_01);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium with P= 0.05 cells
[S21_cul_05, phs_cul_05] = S21(eps_rea_cul_05,sgm_cul_05,w, z);
figure('Name', 'S21 Culture Medium with 0.05 volum cell');
plot(freq,S21_cul_05);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium with P= 0.025 cells
[S21_cul_025, phs_cul_025] = S21(eps_rea_cul_025,sgm_cul_025,w, z);
figure('Name', 'S21 Culture Medium with 0.025 volum cell');
plot(freq,S21_cul_025);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%Culture Medium with P= 0.0125 cells
[S21_cul_0125, phs_cul_0125] = S21(eps_rea_cul_0125,sgm_cul_0125,w, z);
figure('Name', 'S21 Culture Medium with 0.0125 volum cell');
plot(freq,S21_cul_0125);
xlabel('Frequency in Hz') % x-axis label
ylabel('|S21|') % y-axis label

%% S21(cultivo sin celula) -  S21(P) / S21(cultivo sin celula)

figure('Name','S21(cultivo sin celula) -  S21(P) / S21(cultivo sin celula)');

dif_cul_0_cul_01 = lineal_to_dB((S21_cul_0 - S21_cul_01)./S21_cul_0);
semilogx(freq, dif_cul_0_cul_01);
hold on

dif_cul_0_cul_05 = lineal_to_dB((S21_cul_0 - S21_cul_05)./S21_cul_0);
semilogx(freq,dif_cul_0_cul_05);
hold on

dif_cul_0_cul_025 = lineal_to_dB((S21_cul_0 - S21_cul_025)./S21_cul_0);
semilogx(freq,dif_cul_0_cul_025);
hold on

dif_cul_0_cul_0125 = lineal_to_dB((S21_cul_0 - S21_cul_0125)./S21_cul_0);
semilogx(freq,dif_cul_0_cul_0125);
hold on


xlabel('Frequency (Hz)') % x-axis label
ylabel('S21_c_0 - S21_c_p / S21_c_0') % y-axis label
title('Sensitivity S21_0 - S21_p');
legend('S21_c_0_1','S21_c_0_5', 'S21_c_0_2_5', 'S21_c_0_1_2_5');   

Cell_Proportion = [0.1;0.05;0.025;0.0125];
f_01 = 73;
f_03 = 82;
f_1 = 92;
f_3 = 100;

sen_00_01 = sensibility(S21_cul_0,S21_cul_01);
sen_00_05 = sensibility(S21_cul_0,S21_cul_05);
sen_00_025 = sensibility(S21_cul_0,S21_cul_025);
sen_00_0125 = sensibility(S21_cul_0,S21_cul_0125);

S21_f_01_GHz = [S21_cul_0(f_01);S21_cul_01(f_01);S21_cul_05(f_01);S21_cul_025(f_01);S21_cul_0125(f_01)];
S21_f_03_GHz = [S21_cul_0(f_03);S21_cul_01(f_03);S21_cul_05(f_03);S21_cul_025(f_03);S21_cul_0125(f_03)];
S21_f_1_GHz = [S21_cul_0(f_1);S21_cul_01(f_1);S21_cul_05(f_1);S21_cul_025(f_1);S21_cul_0125(f_1)];
S21_f_3_GHz = [S21_cul_0(f_3);S21_cul_01(f_3);S21_cul_05(f_3);S21_cul_025(f_3);S21_cul_0125(f_3)];


% T = table(Cell_Proportion,S21_f_01_GHz,S21_f_03_GHz,S21_f_1_GHz,S21_f_3_GHz);
% 
% writetable(T, 's21_modul_for__differents_frequencies.xls');
% type 's21_modul_for__differents_frequencies.xls'


%% Sensitivitys Plots 7

% %Definiendo la sensibilidad como la relacion entre amplitudes de la
% %potencia transmitida en dinstintos medios, es decir, la division de
% %amplitudes.
% 
% figure
% 
% 
% dif_cul_0_vac = (S21_cul_0 ./ S21_vac);
% plot(freq, dif_cul_0_vac);
% hold on
% dif_cul_vac = (S21_cul_01 ./ S21_vac);
% plot(freq,dif_cul_vac);
% hold on
% dif_vac_wat = (S21_wat ./ S21_vac);
% plot(freq,dif_vac_wat);
% hold on
% dif_vac_sea = (S21_sea ./ S21_vac );
% plot(freq,dif_vac_sea);
% hold on
% dif_cul_0_wat = (S21_wat ./ S21_cul_0);
% plot(freq, dif_cul_0_wat);
% hold on
% dif_cul_0_sea = ( S21_sea ./  S21_cul_0);
% plot(freq, dif_cul_0_sea);
% hold on
% dif_cul_0_cul = (S21_cul_01 ./  S21_cul_0);
% plot(freq, dif_cul_0_cul);
% hold on
% dif_cul_wat = (S21_cul_01 ./  S21_wat);
% plot(freq, dif_cul_wat);
% hold on
% dif_cul_sea = ( S21_sea ./  S21_cul_01);
% plot(freq, dif_cul_sea);
% hold on 
% title('Sensitivity S21_a / S21_b');
% legend('|S21_c_0 / S21_v|', '|S21_c / S21_v|', '|S21_v / S21_w|', '|S21_s / S21_v|', '|S21_w / S21_c_0|', '|S21_s / S21_c_0|', '|S21_c / S21_c_0|', '|S21_c / S21_w|', '|S21_s / S21_c|');
% xlabel('Frequency (Hz)') % x-axis label
% ylabel('|S21a / S21b|') % y-axis label
% 
% 
% % definiendo la sesibilidad como la diferencia entre amplitudes de la
% % potencia transmitida en distintos medios

% figure
% 
% dif_cul_0_vac = (S21_cul_0 - S21_vac);
% plot(freq, dif_cul_0_vac);
% hold on
% 
% dif_cul_vac = (S21_cul_01 - S21_vac);
% plot(freq,dif_cul_vac);
% hold on
% 
% 
% dif_vac_wat = (S21_vac - S21_wat);
% plot(freq,dif_vac_wat);
% hold on
% 
% 
% dif_vac_sea = (S21_vac - S21_sea);
% plot(freq,dif_vac_sea);
% hold on
% 
% dif_cul_0_wat = (S21_wat - S21_cul_0);
% plot(freq, dif_cul_0_wat);
% hold on
% 
% dif_cul_0_sea = (S21_cul_0 - S21_sea);
% plot(freq, dif_cul_0_sea);
% hold on
% 
% dif_cul_0_cul = (S21_cul_0 - S21_cul_01);
% plot(freq, dif_cul_0_cul);
% hold on
%  
% dif_cul_wat = (S21_wat - S21_cul_01);
% plot(freq, dif_cul_wat);
% hold on
% 
% dif_cul_sea = (S21_cul_01 - S21_sea);
% plot(freq, dif_cul_sea);
% hold on
% xlabel('Frequency (Hz)') % x-axis label
% ylabel('|S21_a - S21_b|') % y-axis label
% title('Sensitivity S21_a - S21_b');
% legend('|S21_c_0 - S21_v|','|S21_c - S21_v|', '|S21_v - S21_w|', '|S21_v - S21_s|', '|S21_w - S21_c_0|','|S21_c_0 - S21_s|', '|S21_c_0 - S21_c|', '|S21_c - S21_w|', '|S21_c - S21_s|');   


%% Functions

function [S21_modul, S21_fase] = S21( eps_rea, sgm, w, z)
% w : angular frequency [rad/s]
% c : light speed 3e8 [m/s]
% z : thickness (3e-3 [m] )


c = 3e8; 	
b = w.*(sqrt(eps_rea))/c;                                   % beta
a= 60*pi*sgm./sqrt(eps_rea);                                % alfa
S21_cmx = exp(-1i.*b.*z).*exp(-a.*z);                       % S parameter (2->1)
S21_modul = abs(S21_cmx);                                   % [W]
S21_fase = angle(S21_cmx);                                  % [rad]


end

function [S11_modul] = S11(eps_cmx)
    rho = ((eps_cmx - eps_0)./(eps_cmx+eps_0));
    S11_modul = 1 - (abs(rho)).^2;
end

function [ output_lineal ] = dB_to_lineal( input_dB )

output_lineal = 10.^(input_dB./10);

end
function [ output_dB ] = lineal_to_dB( input_lineal )

output_dB = 20.*log(input_lineal);

end

function [ r_coa ] = coaxial_geometry( r_cob, Z_cox )

%r_cob [mm] radi ext coaxial
%z_cox [ohms] vacuum impedance
r_coa = r_cob/(exp(Z_cox/60));

end

function [sens] = sensibility(S21a,S21b)

if S21a >= S21b
    sens = (S21a - S21b) ./ S21a ;
else
    sens = (S21b - S21a) ./ S21b ;
end
end

