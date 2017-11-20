%% HFSS sensittivity parametric

load('s21_hfss_parametric.mat');
%% Main
%S21_cul_0
%S21_cul_01
%S21_cul_05
%S21_cul_025
%S21_cul_0125
%S21_vac
%S21_wat
%S21_sea
%r_he = [11.5, 10.5, 10, 9.50, 9, 8.50, 8, 7.5, 7, 6.5, 6, 5.5]
r = 12;
S21_cul_0_sin_plastico = S21_cul_0(:,1);
S21_cul_0125_sin_plastico = S21_cul_0125(:,1); 
S21_cul_025_sin_plastico = S21_cul_025(:,1);
S21_cul_05_sin_plastico = S21_cul_05(:,1);
S21_cul_01_sin_plastico = S21_cul_01(:,1);



sen_00_0125_sin_plastico = sensibility(S21_cul_0125_sin_plastico, S21_cul_0_sin_plastico);
sen_00_025_sin_plastico = sensibility(S21_cul_025_sin_plastico, S21_cul_0_sin_plastico);
sen_00_05_sin_plastico = sensibility(S21_cul_05_sin_plastico, S21_cul_0_sin_plastico);
sen_00_01_sin_plastico = sensibility(S21_cul_01_sin_plastico, S21_cul_0_sin_plastico);

% for i = 1:r
%      sen_00_0125 = sensibility(S21_cul_0125(:,i), S21_cul_0(:,i));
%      sen_00_025 = sensibility(S21_cul_0125_sin_plastico, S21_cul_0_sin_plastico);
%      sen_00_05 = sensibility(S21_cul_0125_sin_plastico, S21_cul_0_sin_plastico);
%      sen_00_01 = sensibility(S21_cul_0125_sin_plastico, S21_cul_0_sin_plastico);
% end       

%% Plots
%Sensibilidades
figure('Name', 'Sensitivity for differents P without holder extern')
 
semilogx(freq, sen_00_01_sin_plastico, '-.')
hold on
semilogx(freq, sen_00_05_sin_plastico, '--o')
hold on
semilogx(freq, sen_00_025_sin_plastico, ':s')
hold on
semilogx(freq, sen_00_0125_sin_plastico, '+' )
hold on

title('Sensitivity for differents P without holder extern for z = 3mm'); 
% if z==3e-3
% 
%     title('Sensitivity for differents P for z = 3mm'); 
% else
%     title('Sensitivity for differents P for z = 10mm'); 
% end  
xlabel('Frequency (Hz)') % x-axis label
ylabel('(S21_p - S21_0) / S21_p (dB)') %y-axis label 
legend('P = 0.1','P = 0.05', 'P = 0.025', 'P = 0.0125');

%S21 modul

plotValors(freq,S21_cul_0_sin_plastico,'S21 Culture Medium without cells','Frequency (Hz)','mod(S21)');
plotValors(freq,S21_cul_01_sin_plastico,'S21 Culture Medium with 0.1 volum cell','Frequency (Hz)','mod(S21)');
plotValors(freq,S21_cul_05_sin_plastico,'S21 Culture Medium with 0.05 volum cell','Frequency (Hz)','mod(S21)');
plotValors(freq,S21_cul_025_sin_plastico,'S21 Culture Medium with 0.025 volum cell','Frequency (Hz)','mod(S21)');
plotValors(freq,S21_cul_0125_sin_plastico,'S21 Culture Medium with 0.0125 volum cell','Frequency (Hz)','mod(S21)');

%% Function
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