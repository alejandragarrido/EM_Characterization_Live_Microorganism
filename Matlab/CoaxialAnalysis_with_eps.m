%Coaxial analysis
z2 = 10e-3;
z1= 1e-3;
freq = [1*10^6, 100*10^6, 1*10^9];
% freq = 1e6;
% f_min=1e8;                  %[Hz]       1MHz
% f_max=1e9;                  %[Hz]       3GHz
% N_f=101;
% freq = logspace(log10(f_min),log10(f_max),N_f);

w = 2*pi.*freq;
eps_0 = 1;
e0 = 8.85e-12;
mu0 = pi*4e-7;
eps_b = eps_0;
eps_p = 2.25;
% sgm_wat_dis = 0.002;
% eps_rea_wat_dis = 81;
% sgm_sea_wat = 4;
% eps_rea_sea_wat = 81;

% [ S21_cul_0_mod] = evaluateCoaxial(eps_rea_cul_0, eps_p , eps_b,eps_ssp_cul_0, w,z1, z2);
[ S21_cul_01_mod] = evaluateCoaxial(eps_rea_cul_01, eps_p , eps_b,eps_ssp_cul_01, w,z1, z2);
% [ S21_cul_05_mod] = evaluateCoaxial(eps_rea_cul_05, eps_p , eps_b,eps_ssp_cul_05, w,z1, z2);
% [ S21_cul_025_mod] = evaluateCoaxial(eps_rea_cul_025, eps_p , eps_b,eps_ssp_cul_025, w,z1, z2);
% [ S21_cul_0125_mod] = evaluateCoaxial(eps_rea_cul_0125, eps_p , eps_b,eps_ssp_cul_0125, w,z1, z2);

%Todas las sensibilidades son respecto el medio de cultivo sin celulas

% sens_01 = sensibility(S21_cul_01_mod,S21_cul_0_mod);
% sens_05 = sensibility(S21_cul_05_mod,S21_cul_0_mod);
% sens_025 = sensibility(S21_cul_025_mod,S21_cul_0_mod);
% sens_0125 = sensibility(S21_cul_0125_mod,S21_cul_0_mod);

% Plot Sensibilidades
% figure('Name', 'Sensitivity for differents P')
%  
% semilogx(freq, sens_01, '-.')
% hold on
% semilogx(freq, sens_05, '--o')
% hold on
% semilogx(freq, sens_025, ':s')
% hold on
% semilogx(freq, sens_0125, '+' )
% hold on
% title('Sensitivity for differents P for z = 3mm'); 
% xlabel('Frequency (Hz)') % x-axis label
% ylabel('(S21_p - S21_0) / S21_p') %y-axis label 
% legend('P = 0.1','P = 0.05', 'P = 0.025', 'P = 0.0125');
% 
% Plot S21
figure('Name', 'S21 for differents P')
 
semilogx(freq, S21_cul_01_mod, '-.')
hold on
% semilogx(freq, S21_cul_05_mod, '--o')
% hold on
% semilogx(freq, S21_cul_025_mod, ':s')
% hold on
% semilogx(freq, S21_cul_0125_mod, '+' )
% hold on
% semilogx(freq, S21_cul_0_mod )
% hold on

xlabel('Frequency (Hz)') % x-axis label
ylabel('(S21_p') %y-axis label 
legend('P = 0.1','P = 0.05', 'P = 0.025', 'P = 0.0125', 'P=0');


function [S21] = evaluateCoaxial(eps_c,eps_p,eps_v,eps_c_cmp, w,z1,z2)
nc = sqrt(eps_c);
nv = sqrt(eps_v);
np = sqrt(eps_p);


c = 3e8;
rho_1 = (np-nv)./(np+nv);
rho_2 = (nc-np)./(nc+np);
rho_3 = (np-nv)./(np+nv);

tau_1 = 1 + (rho_1);
tau_2 = 1 + (rho_2);
tau_3 = 1 + (rho_3);


k2 = w.*sqrt(eps_c_cmp)./c;
k1 = w.*np./c;
% x = sgm_c./(2.*eps_c)
% beta = k.*(1+((1/8).*x.^2))
% alpha = 60.*pi.*sgm_c./2
% k1 = beta - 1i*alpha
a1 = (exp(-1i.*2.*k1.*z1));
a2 = (exp(-1i.*2.*k2.*z2));
% E1neg = (rho_1 + (rho_2.*a1) + (rho_1.*rho_2.*a2) + (rho_3.*a1.*a2));
E1pos = (1 + (rho_1.*rho_2.*a1) + (rho_2.*rho_3.*a2) + (rho_1.*rho_3.*a1.*a2));
% S11 = E1neg./E1pos;

E2pos = tau_1.*tau_2.*tau_3.*(a1./2).*(a2./2);
S21 = E2pos./E1pos;
% S21 = abs(sqrt(1-abs(S11).^2));


end

function [sens] = sensibility(S21a,S21b)

    sens = abs((S21a - S21b) ./ S21a );
    sens = 20*log10(sens);
end
                            


