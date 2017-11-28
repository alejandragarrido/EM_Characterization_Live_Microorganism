%MATLAB
%   --------------------|----- z ---------|---------------------
%                       |                 |
%    ---na-------E1+--> |-----n1---E'2+-->|--->E2+         nb
%                       | medi de cultiu  |
%   --------------------|-----------------|----------------------
%
%HFSS
%   -----------------|---|----- z ---------|---------------------
%                    |n2 |                 |
%           na       |   |       n1        |         nb
%                    |   | medi de cultiu  |
%   -----------------|---|-----------------|----------------------
% n2: plastico


%Coaxial analysis
%Vacuum - Culture Medium - Vacuum
z = 30e-3;
freq = [1*10^6, 100*10^6, 1*10^9];
% freq = 1e6;
w = 2*pi.*freq
eps_0 = 1;
e0 = 8.85e-12
mu0 = pi*4e-7;
% eps_rea_cul_0 = 81;
% sgm_cul_0 = 0.35;
% eps_1 = eps_rea_cul_01
% eps_cmp_1 = eps_ssp_cul_0
% sgm1_1 = sgm_cul_01
% eps_cmp_1 = e0
% sgm1_1 = 0
% eps_1 = eps_0
eps_b = eps_0
sgm_wat_dis = 0.002;
eps_rea_wat_dis = 81;


[S21_cul_0 , S21_cul_0_mod] = evaluateCoaxial(eps_rea_cul_0, sgm_cul_0, eps_b, w,z)
[S21_cul_01 , S21_cul_01_mod] = evaluateCoaxial(eps_rea_cul_01, sgm_cul_01, eps_b, w,z)
[S21_vacuum , S21_vacuum_mod] = evaluateCoaxial(1, 0, eps_b, w,z)
[S21_wat_dis , S21_wat_dis_mod] = evaluateCoaxial(eps_rea_wat_dis, sgm_wat_dis, eps_b, w,z)

function [S21, S21_mod] = evaluateCoaxial(eps_1,sgm_1, eps_b,w,z)
n1 = sqrt(eps_1);
nb = sqrt(eps_b);
na = nb;

c = 3e8;
rho_1 = ( n1 - na )./(n1 + na);
rho_2 = (nb - n1)./(n1 + nb);
tau_1 = 1 + (rho_1);
tau_2 = 1 + (rho_2);

%Amb aproximacio del llibre de rutgers
% k1 =w.*n1./c
%Amb aproximacio Non ideal transmission line
k = w.*n1./c;
x = sgm_1./(2.*eps_1);
beta = k.*(1+((1/8).*x.^2));
alpha = 60.*pi.*sgm_1./2;
k1 = beta - 1i*alpha;

S21 = tau_1.*tau_2./(exp(1i.*k1.*z).*(1+(rho_1.*rho_2.*exp(-1i.*2.*k1.*z))));
S21_mod = abs(S21);

end


                            


