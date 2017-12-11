
%% Main
%S21_cul_0
%S21_cul_01
%S21_cul_05
%S21_cul_025
%S21_cul_0125


sen_00_01 = sensibility(S21_cul_01, S21_cul_0);
sen_00_05 = sensibility(S21_cul_05, S21_cul_0);
sen_00_025 = sensibility(S21_cul_025, S21_cul_0);
sen_00_0125 = sensibility(S21_cul_0125, S21_cul_0);

%% Plots
%Sensibilidades
figure('Name', 'Sensitivity for differents P')
 
semilogx(freq, sen_00_01, '-.')
hold on
semilogx(freq, sen_00_05, '--o')
hold on
semilogx(freq, sen_00_025, ':s')
hold on
semilogx(freq, sen_00_0125, '+' )
hold on

title('Sensitivity for differents P for z = 3mm'); 
% if z==3e-3
% 
%     title('Sensitivity for differents P for z = 3mm'); 
% else
%     title('Sensitivity for differents P for z = 10mm'); 
% end  
xlabel('Frequency (Hz)') % x-axis label
ylabel('(S21_p - S21_0) / S21_p (dB)') %y-axis label 
% legend('P = 0.1','P = 0.05', 'P = 0.025', 'P = 0.0125');

%% Function
function [sens] = sensibility(S21a,S21b)

    sens = (S21a - S21b) ./ S21a ;
    sens = 20*log10(sens);
end