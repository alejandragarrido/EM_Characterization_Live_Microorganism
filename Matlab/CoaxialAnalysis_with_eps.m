%Coaxial analysis
z2 = 3e-3;
z1= 1e-3;
f_min=1e6;                
f_max=10e9;                 
N_f=1003;
freq = logspace(log10(f_min),log10(f_max),N_f);
c = 3e8;
w = 2*pi.*freq;
eps_0 = 1;
e0 = 8.85e-12;
mu0 = pi*4e-7;
eps_b = eps_0;
eps_p = 2.25;


eps_c = eps_rea_cul_0;
eps_v = eps_b;
eps_c_cmp = eps_ssp_cul_0;

nc = sqrt(eps_c)
nv = sqrt(eps_v);
np = sqrt(eps_p);

rho_1 = (np-nv)./(np+nv);
% rho_2 = (nc-np)./(nc+np)
rho_2 = 0.7143;
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
% a1 = (exp(-1i.*2.*k1.*z1));
% a2 = (exp(-1i.*2.*k2.*z2));
% E1neg = (rho_1 + (rho_2.*a1) + (rho_1.*rho_2.*a2) + (rho_3.*a1.*a2));
% E1pos = (1 + (rho_1.*rho_2.*a1) + (rho_2.*rho_3.*a2) + (rho_1.*rho_3.*a1.*a2));
% S11 = E1neg./E1pos;

% E2pos = tau_1.*tau_2.*tau_3.*(a1./2).*(a2./2);
% S21 = E2pos./E1pos;
% S21 = abs(sqrt(1-abs(S11).^2));
a1_pos = (exp(1i.*k1.*z1))
a1_neg = (exp(-1i.*k1.*z1))
a2_pos = (exp(1i.*k2.*z2))
a2_neg = (exp(-1i.*k2.*z2))

% E1 = [E1_pos E1_neg];
R1  = [[1 rho_1]' [rho_1 1]']
R2  = [[1 rho_2]' [rho_2 1]']
R3  = [[1 rho_3]' [rho_3 1]']
A1 = [[a1_pos 0]' [0 a1_neg]'];
A2 = [[a2_pos 0]' [0 a2_neg]'];

% X = (1./(tau_1.*tau_2.*tau_3)).*R1.*A1.*R2.*A2.*R3
% E3 = [E3_pos 0];

                            


