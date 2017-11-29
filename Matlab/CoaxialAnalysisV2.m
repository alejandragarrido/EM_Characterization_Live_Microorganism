%Coaxial analysis

z = 30e-3;
% freq = [1*10^6, 100*10^6, 1*10^9];
% freq = 1e6;
f_min=1e8;                  %[Hz]       10kHz
f_max=3e9;                  %[Hz]       1GHz
N_f=101;
freq = logspace(log10(f_min),log10(f_max),N_f);

w = 2*pi.*freq;
eps_0 = 1;
e0 = 8.85e-12;
mu0 = pi*4e-7;
% eps_rea_cul_0 = 81;
% sgm_cul_0 = 0.35;
% eps_1 = eps_rea_cul_01
% eps_cmp_1 = eps_ssp_cul_0
% sgm1_1 = sgm_cul_01
% eps_cmp_1 = e0
% sgm1_1 = 0
% eps_1 = eps_0
eps_b = eps_0;
sgm_wat_dis = 0.002;
eps_rea_wat_dis = 81;
sgm_sea_wat = 4;
eps_rea_sea_wat = 81;


[S21_cul_0 , S21_cul_0_mod] = evaluateCoaxial(eps_rea_cul_0, sgm_cul_0, eps_b, w,z);
[S21_cul_01 , S21_cul_01_mod] = evaluateCoaxial(eps_rea_cul_01, sgm_cul_01, eps_b, w,z);
[S21_cul_05 , S21_cul_05_mod] = evaluateCoaxial(eps_rea_cul_05, sgm_cul_05, eps_b, w,z);
[S21_cul_025 , S21_cul_025_mod] = evaluateCoaxial(eps_rea_cul_025, sgm_cul_025, eps_b, w,z);
[S21_cul_0125 , S21_cul_0125_mod] = evaluateCoaxial(eps_rea_cul_0125, sgm_cul_0125, eps_b, w,z);
[S21_vacuum , S21_vacuum_mod] = evaluateCoaxial(1, 0, eps_b, w,z);
[S21_wat_dis , S21_wat_dis_mod] = evaluateCoaxial(eps_rea_wat_dis, sgm_wat_dis, eps_b, w,z);
[S21_sea_wat , S21_sea_wat_mod] = evaluateCoaxial(eps_rea_sea_wat, sgm_sea_wat, eps_b, w,z);

%Todas las sensibilidades son respecto el medio de cultivo sin celulas

sens_01 = sensibility(S21_cul_01_mod,S21_cul_0_mod);
sens_05 = sensibility(S21_cul_05_mod,S21_cul_0_mod);
sens_025 = sensibility(S21_cul_025_mod,S21_cul_0_mod);
sens_0125 = sensibility(S21_cul_0125_mod,S21_cul_0_mod);

% Plot Sensibilidades
figure('Name', 'Sensitivity for differents P')
 
semilogx(freq, sens_01, '-.')
hold on
semilogx(freq, sens_05, '--o')
hold on
semilogx(freq, sens_025, ':s')
hold on
semilogx(freq, sens_0125, '+' )
hold on
if z==3e-3

    title('Sensitivity for differents P for z = 3mm'); 
else
    title('Sensitivity for differents P for z = 30mm'); 
end  
xlabel('Frequency (Hz)') % x-axis label
ylabel('(S21_p - S21_0) / S21_p') %y-axis label 
legend('P = 0.1','P = 0.05', 'P = 0.025', 'P = 0.0125');

% Plot S21
figure('Name', 'S21 for differents P')
 
semilogx(freq, S21_cul_01_mod, '-.')
hold on
semilogx(freq, S21_cul_05_mod, '--o')
hold on
semilogx(freq, S21_cul_025_mod, ':s')
hold on
semilogx(freq, S21_cul_0125_mod, '+' )
hold on
semilogx(freq, S21_cul_0_mod, '*' )
hold on

xlabel('Frequency (Hz)') % x-axis label
ylabel('(S21_p') %y-axis label 
legend('P = 0.1','P = 0.05', 'P = 0.025', 'P = 0.0125', 'P=0');


function [S21, S21_mod] = evaluateCoaxial(eps_1,sgm_1, eps_b,w,z)
n1 = sqrt(eps_1);
nb = sqrt(eps_b);
na = nb;

c = 3e8;
rho_1 = ( n1 - na )./(n1 + na)
rho_2 = (nb - n1)./(n1 + nb)
tau_1 = 1 + (rho_1)
tau_2 = 1 + (rho_2)

k = w.*n1./c
x = sgm_1./(2.*eps_1)
beta = k.*(1+((1/8).*x.^2))
alpha = 60.*pi.*sgm_1./2
k1 = beta - 1i*alpha

S21 = tau_1.*tau_2./(exp(1i.*k1.*z).*(1+(rho_1.*rho_2.*exp(-1i.*2.*k1.*z))));
S21_mod = abs(S21);

end

function [sens] = sensibility(S21a,S21b)

    sens = abs((S21a - S21b) ./ S21a );
    sens = 20*log10(sens);
end
                            


