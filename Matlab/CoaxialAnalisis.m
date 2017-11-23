% close all
% clear all
% load('Parameters\permittivities_sgm_scenario.mat');
%Frequency range
z = 3e-3;
% f_min=1e8;                  %[Hz]       10kHz
% f_max=3e9;                  %[Hz]       1GHz
% N_f=101;
% freq = logspace(log10(f_min),log10(f_max),N_f);
freq = [1*10^6, 100*10^6, 1*10^9];
w = 2*pi.*freq;
%%TEM waves coaxial propagation
% eps_rea_vac = 1;
% eps_rea_wat = 81;
% eps_rea_sea = 81;
% sgm_vac = 0;
% sgm_wat = 0.002;
% sgm_sea = 4;

%% S21 

%Vacuum
% [alpha_vac, beta_vacm ,S21_vac, phs_vac] = S21(eps_rea_vac, sgm_vac, w, z);
%Distilled Water
% [alpha_wat, beta_wat, S21_wat, phs_wat] = S21(eps_rea_wat,sgm_wat,w, z);
%Water Sea
% [alpha_sea, beta_sea, S21_sea, phs_sea] = S21(eps_rea_sea,sgm_sea,w, z);
%Culture Medium without cells
[rho_cul_0, tau_cul_0, S21_cmx_cul_0, S21_cul_0, phs_cul_0] = S21(eps_rea_cul_0,sgm_cul_0,w, z)
%Culture Medium with P= 0.1 cells
[rho_cul_01,tau_cul_01, S21_cmx_cul_01, S21_cul_01, phs_cul_01] = S21(eps_rea_cul_01,sgm_cul_01,w, z)
%Culture Medium with P= 0.05 cells
% [alpha_cul_05, beta_cul_05,S21_cmx_cul_05, S21_cul_05, phs_cul_05] = S21(eps_rea_cul_05,sgm_cul_05,w, z);
% %Culture Medium with P= 0.025 cells
% [alpha_cul_025, beta_cul_025,S21_cmx_cul_025, S21_cul_025, phs_cul_025] = S21(eps_rea_cul_025,sgm_cul_025,w, z);
% %Culture Medium with P= 0.0125 cells
% [aplha_cul_0125, beta_cul_0125,S21_cmx_cul_0125, S21_cul_0125, phs_cul_0125] = S21(eps_rea_cul_0125,sgm_cul_0125,w, z);

% Sensibilidad

sen_00_01 = sensibility(S21_cul_01, S21_cul_0);
% sen_00_05 = sensibility(S21_cul_05, S21_cul_0);
% sen_00_025 = sensibility(S21_cul_025, S21_cul_0);
% sen_00_0125 = sensibility(S21_cul_0125, S21_cul_0);

%% Table
% Cell_Proportion_4 = [0.1;0.05;0.025;0.0125];
% Cell_Proportion_total = [0.1;0.05;0.025;0.0125; 0];
% f_1 = 74; %frequency 9.9609e7
% f_2 = 82; %frequency 3.0991e8
% f_3 = 92;  %frequency 1.0938e9
% f_4 = 100; %frequency 3e9
% 
% 
% Sen_f_1_GHz = [sen_00_01(f_1);sen_00_05(f_1);sen_00_025(f_1);sen_00_0125(f_1)];
% Sen_f_2_GHz = [sen_00_01(f_2);sen_00_05(f_2);sen_00_025(f_2);sen_00_0125(f_2)];
% Sen_f_3_GHz = [sen_00_01(f_3);sen_00_05(f_3);sen_00_025(f_3);sen_00_0125(f_3)];
% Sen_f_4_GHz = [sen_00_01(f_4);sen_00_05(f_4);sen_00_025(f_4);sen_00_0125(f_4)];
% 
% S21_f_1_GHz = [S21_cul_01(f_1);S21_cul_05(f_1);S21_cul_025(f_1);S21_cul_0125(f_1);S21_cul_0(f_1)];
% S21_f_2_GHz = [S21_cul_01(f_2);S21_cul_05(f_2);S21_cul_025(f_2);S21_cul_0125(f_2);S21_cul_0(f_2)];
% S21_f_3_GHz = [S21_cul_01(f_3);S21_cul_05(f_3);S21_cul_025(f_3);S21_cul_0125(f_3);S21_cul_0(f_3)];
% S21_f_4_GHz = [S21_cul_01(f_4);S21_cul_05(f_4);S21_cul_025(f_4);S21_cul_0125(f_4);S21_cul_0(f_4)];

% 
% T = table(Cell_Proportion_4,Sen_f_1_GHz,Sen_f_2_GHz,Sen_f_3_GHz,Sen_f_4_GHz);
% writetable(T, 'sensibilidad.xls');
% type 'sensibilidad.xls'
% 
% T2 = table(Cell_Proportion_total,S21_f_1_GHz,S21_f_2_GHz,S21_f_3_GHz,S21_f_4_GHz);
% writetable(T2, 's21.xls');
% type 's21.xls'


%% Sensitivities 

%Definiendo la sensibilidad como la relacion entre amplitudes de la
%potencia transmitida en dinstintos medios, es decir, la division de
%amplitudes.
i = 2;
if i == 0
    dif_cul_0_vac = (S21_cul_0 ./ S21_vac); 
    dif_cul_vac = (S21_cul_01 ./ S21_vac); 
    dif_vac_wat = (S21_wat ./ S21_vac);
    dif_vac_sea = (S21_sea ./ S21_vac ); 
    dif_cul_0_wat = (S21_wat ./ S21_cul_0); 
    dif_cul_0_sea = ( S21_sea ./  S21_cul_0); 
    dif_cul_0_cul = (S21_cul_01 ./  S21_cul_0);
    dif_cul_wat = (S21_cul_01 ./  S21_wat);
    dif_cul_sea = ( S21_sea ./  S21_cul_01);
elseif i == 1

% definiendo la sesibilidad como la diferencia entre amplitudes de la 
%potencia transmitida en distintos medios

    dif_cul_0_vac = (S21_cul_0 - S21_vac); 
    dif_cul_vac = (S21_cul_01 - S21_vac); 
    dif_vac_wat = (S21_vac - S21_wat);
    dif_vac_sea = (S21_vac - S21_sea);
    dif_cul_0_wat = (S21_wat - S21_cul_0);
    dif_cul_0_sea = (S21_cul_0 - S21_sea);
    dif_cul_0_cul = (S21_cul_0 - S21_cul_01); 
    dif_cul_wat = (S21_wat - S21_cul_01); 
    dif_cul_sea = (S21_cul_01 - S21_sea);
else
    ext = 'no compute sensittivity';
end

%% Plots

% figure
% plot(freq, dif_cul_0_vac); 
% hold on
% plot(freq,dif_cul_vac); 
% hold on
% plot(freq,dif_vac_wat);
% hold on
% plot(freq,dif_vac_sea);
% hold on
% plot(freq, dif_cul_0_wat); 
% hold on
% plot(freq, dif_cul_0_sea);
% hold on
% plot(freq, dif_cul_0_cul); 
% hold on
% plot(freq, dif_cul_wat); 
% hold on
% plot(freq, dif_cul_sea);
% hold on
% xlabel('Frequency (Hz)') % x-axis label
% ylabel('|S21_a - S21_b|') %y-axis label 
% title('Sensitivity S21_a - S21_b'); 
% legend('|S21_c_0 -S21_v|','|S21_c - S21_v|', '|S21_v - S21_w|', '|S21_v - S21_s|', '|S21_w- S21_c_0|','|S21_c_0 - S21_s|', '|S21_c_0 - S21_c|', '|S21_c - S21_w|','|S21_c - S21_s|');

% %S21 modulo para disintos materiales
% plotValors(freq,S21_vac,'S21 Vacuum','Frequency (Hz)','mod(S21)');
% plotValors(freq,S21_wat,'S21 Distilled Water','Frequency (Hz)','mod(S21)');
% plotValors(freq,S21_sea,'S21 Sea Water','Frequency (Hz)','mod(S21)');
% plotValors(freq,S21_cul_0,'S21 Culture Medium without cells','Frequency (Hz)','mod(S21)');
% plotValors(freq,S21_cul_01,'S21 Culture Medium with 0.1 volum cell','Frequency (Hz)','mod(S21)');
% plotValors(freq,S21_cul_05,'S21 Culture Medium with 0.05 volum cell','Frequency (Hz)','mod(S21)');
% plotValors(freq,S21_cul_025,'S21 Culture Medium with 0.025 volum cell','Frequency (Hz)','mod(S21)');
% plotValors(freq,S21_cul_0125,'S21 Culture Medium with 0.0125 volum cell','Frequency (Hz)','mod(S21)');

%Sensibilidades
figure('Name', 'Sensitivity for differents P')
 
semilogx(freq, sen_00_01, '-.')
hold on
% semilogx(freq, sen_00_05, '--o')
% hold on
% semilogx(freq, sen_00_025, ':s')
% hold on
% semilogx(freq, sen_00_0125, '+' )
% hold on
if z==3e-3

    title('Sensitivity for differents P for z = 3mm'); 
else
    title('Sensitivity for differents P for z = 10mm'); 
end  
xlabel('Frequency (Hz)') % x-axis label
ylabel('(S21_p - S21_0) / S21_p') %y-axis label 
legend('P = 0.1','P = 0.05', 'P = 0.025', 'P = 0.0125');

%% Functions

% function [alpha, beta, S21_cmx, S21_modul, S21_fase] = S21( eps_rea, sgm, w, z)
% % w : angular frequency [rad/s]
% % c : light speed 3e8 [m/s]
% % z : thickness (3e-3 [m] )
% 
% 
% c = 3e8; 	
% beta = w.*(sqrt(eps_rea))/c;                                   % beta
% alpha = 60*pi*sgm./sqrt(eps_rea);                                % alfa
% S21_cmx = exp(-1i.*beta.*z).*exp(-alpha.*z);                        % S parameter (2->1)
% S21_modul = exp(-alpha.*z);                                      % [W]
% S21_fase = exp(-1i.*beta.*z);                                   % [rad]
% 
% 
% end

function [rho, tau, S21_cmx, S21_modul, S21_fase] = S21( eps_rea, sgm, w, z)
% w : angular frequency [rad/s]
% c : light speed 3e8 [m/s]
% z : thickness (3e-3 [m] )
eps_0 = 1;
rho = ((sqrt(eps_rea) - sqrt(eps_0))./(sqrt(eps_rea)+sqrt(eps_0)));
tau = 1 - abs(rho).^2;
c = 3e8; 	
beta = w.*(sqrt(eps_rea))/c;                                   % beta
alpha = 60*pi*sgm./sqrt(eps_rea);                                % alfa
S21_cmx = exp(-1i.*beta.*z).*exp(-alpha.*z);                        % S parameter (2->1)
S21_modul = sqrt(tau).*exp(-alpha.*z);                                      % [W]
S21_fase = exp(-1i.*beta.*z);                                   % [rad]


end
function [S11_modul] = S11(eps_cmx)
    rho = ((eps_cmx - eps_0)./(eps_cmx+eps_0));
    S11_modul = 1 - (abs(rho)).^2;
end
function [ output_lineal ] = dB_to_lineal( input_dB )

output_lineal = 10.^(input_dB./10);

end
function [ output_dB ] = lineal_to_dB( input_lineal )

output_dB = 20.*log10(input_lineal);

end
function [ r_coa ] = coaxial_geometry( r_cob, Z_cox )

% r_cob [mm] radi ext coaxial
% z_cox [ohms] vacuum impedance
r_coa = r_cob/(exp(Z_cox/60));

end
function [sens] = sensibility(S21a,S21b)

    sens = (S21a - S21b) ./ S21a ;
    sens = 20*log10(sens);
end
function plotValors(x,y,string,labelx,labely)
figure('Name', string);
plot(x, y);
xlabel(labelx) % x-axis label
ylabel(labely) % y-axis label
end

