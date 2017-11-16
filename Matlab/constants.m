%Frequency range
f_min=1e4;                  %[Hz]       10kHz
f_max=3e9;                  %[Hz]       1GHz
N_f=101;
freq = logspace(log10(f_min),log10(f_max),N_f);
w = 2*pi.*freq;
%%TEM waves coaxial propagation
eps_rea_vac = 1;
sgm_vac = 0;
eps_rea_wat = 81;
sgm_wat = 0.002;
eps_rea_sea = 81;
sgm_sea = 4;
z = 10e-3;
