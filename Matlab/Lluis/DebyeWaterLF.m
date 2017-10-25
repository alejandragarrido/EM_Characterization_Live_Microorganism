%   Dielectric Dispersion in Water 10 mHz to30 MHz
clc
clear all
close all


% Frequency range
f_min=1.0*1e4;
f_max=3.0*1e9;
N_f=101;
%del_f=(f_max-f_min)/(N_f-1);
eps_ssp(1:N_f)=0+0*1i;
Frq=logspace(log10(f_min),log10(f_max),N_f);


%Water Debye Model Parameters
%eps_0=8.854*1e-12;
%eps_inf=80*eps_0;
%sgm_wat=1.5*1e-6;
%tau_wat=0.9;
%eps_stc=1.9*1e7*eps_0;

eps_0=8.854*1e-12;
eps_inf=81*eps_0;
sgm_wat=0;
tau_wat=0;
eps_stc=81*eps_0;




%Electrode dimensions
sur_eld=0.5*1e-4;
dst_eld=0.5*1e-3;

% Debye model with conductivity
% eps(frq)=eps_real(frq)-1i*eps_imag(frq)

for n_f=1:N_f;
    %frq=f_min+(n_f-1)*del_f;
    frq=Frq(n_f);
    X(n_f)=frq;
    eps_wat(n_f)=eps_inf+((eps_stc-eps_inf)/(1+1i*2*pi*frq*tau_wat))-1i*(sgm_wat/frq);
    rst(n_f)=-(1/(2*pi*frq))*(imag(eps_wat(n_f))/(real(eps_wat(n_f))^2+imag(eps_wat(n_f))^2))*(dst_eld/sur_eld);
    rct(n_f)=(1/(2*pi*frq))*(real(eps_wat(n_f))/(real(eps_wat(n_f))^2+imag(eps_wat(n_f))^2))*(dst_eld/sur_eld);
end


figure('Name', 'eps_water_real');
loglog(X, real(eps_wat)/eps_0)
figure('Name', 'eps_water_imag');
loglog(X, -imag(eps_wat)/eps_0)
figure('Name', 'Resistance_water');
loglog(X,rst)
figure('Name', 'Reactance_water');
loglog(X,rct)
