close all
%% Coaxial phisic parameters
% Frequency range
f_min=1e4;                  %[Hz]       10kHz
f_max=3e9;                  %[Hz]       1GHz
N_f=101;
freq = logspace(log10(f_min),log10(f_max),N_f);
w = 2*pi.*freq;

r_cob = 6;                                      % [mm] radi ext coaxial
z_cox = 50;                                     % [ohms] vacuum impedance
r_coa = r_cob/(exp(z_cox/60));

%% Culture medium phisic parameters
g_pla = 1;                                      % [mm] gruix plastic cont

r_int = r_coa + g_pla;                          % [mm]  radi intern corona
r_ext = r_cob - g_pla;                          % [mm]  radi extern corona
h_cor = 1;                                      % [mm]  altura corona
% s_cor =                                       % [mm2] superficie corona
% v_cel = s_cor * h_cor;                        % [mm3] volum de coltiu


%% Plot coaxial

figure('name', 'Coaxial with culture medium');

[x,y,z] = cylinder(r_cob +1);
h = hgtransform;
% surf(x,y,z, 'Parent', h, 'FaceColor', 'r');
view(3)
hold on
cylinder(r_cob);
hold on
cylinder(r_cob - 1);
hold on
cylinder(r_coa + 1);
hold on
cylinder(r_coa);



%% TEM waves coaxial propagation
% e^-jkz = e^-j*bet*z*e^alf*z
z = 3e-3;
c = 3e8;                                %[m/s] light speed
% Load permitivities 

%%%%%%%% VACUUM  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b_vac = w.*(sqrt(eps_0))./c;                            % beta
a_vac = 60*pi*0./sqrt(eps_0);                           % alfa
S21_vac = exp(-1i.*b_vac.*z).*exp(-a_vac.*z);           % S parameter (2->1)

%%%%%%% WATER DISTILLED %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
e_rea_w = 81;
sgm_w = 0.0002;

b_wat = w.*(sqrt(e_rea_w))/c;                               % beta
a_wat = 60*pi*sgm_w./sqrt(e_rea_w);                         % alfa
S21_wat = exp(-1i.*b_wat.*z).*exp(-a_wat.*z);               % S parameter (2->1)

%%%%%%% SEA WATER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
e_rea_sea = 81;
sgm_sea = 4;

b_sea = w.*(sqrt(e_rea_sea))/c;                                 % beta
a_sea = 60*pi*sgm_sea./sqrt(e_rea_sea);                         % alfa
S21_sea = exp(-1i.*b_sea.*z).*exp(-a_sea.*z);                   % S parameter (2->1)

%%%%%%%% CULTURE MEDIUM WITH P=0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
e_rea_c_0 = eps_rea_cul_0;

b_cul_0 = w.*(sqrt(e_rea_c_0))/c;                           % beta
a_cul_0= 60*pi*sgm_cul_0./sqrt(e_rea_c_0);                  % alfa
S21_cul_0 = exp(-1i.*b_cul_0.*z).*exp(-a_cul_0.*z);         % S parameter (2->1)

%%%%%%%% CULTURE MEDIUM WITH P=0.1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
e_rea_c = eps_rea_cul;

b_cul = w.*(sqrt(e_rea_c))/c;                           % beta
a_cul= 60*pi*sgm_cul./sqrt(e_rea_c);                    % alfa
S21_cul = exp(-1i.*b_cul.*z).*exp(-a_cul.*z);           % S parameter (2->1)

%%%%%% S21_water - S21_culture || S21_vacuum - S21_culture %%%%%%%%%%%%%%%%
%Falta cambiar las dimensiones de los vectores

dif_cul_vac = abs(S21_cul - S21_vac);
dif_cul_wat = abs(S21_cul - S21_wat);
dif_cul_sea = abs(S21_cul - S21_sea);
dif_vac_wat = abs(S21_vac - S21_wat);
dif_vac_sea = abs(S21_vac - S21_sea);
dif_cul_0_vac = abs(S21_cul_0 - S21_vac);
dif_cul_0_wat = abs(S21_cul_0 - S21_wat);
dif_cul_0_sea = abs(S21_cul_0 - S21_sea);

figure('Name', 'S21 Vacuum');
plot(freq, S21_vac);

figure('Name', 'S21 Culture Medium without cells');
plot(freq, S21_cul_0);

figure('Name', 'S21 Culture Medium with 0.1 volum cell');
plot(freq, S21_cul);

figure ('Name', 'S21 Distilled Water');
plot(freq, S21_wat);

figure ('Name', 'S21 Sea Water');
plot(freq, S21_sea);


figure('Name', 'Sensitivity Vacuum - Culture Medium (P=0.1)');
plot(freq, dif_cul_vac);

figure('Name', 'Sensitivity Vacuum - Destilled Water');
plot(freq, dif_cul_wat);

figure('Name', 'Sensitivity Vacuum - Sea Water');
plot(freq, dif_cul_wat);

figure('Name', 'Sensitivity Vacuum - Destilled Water');
plot(freq, dif_vac_wat);

figure('Name', 'Sensitivity Vacuum - Destilled Water');
plot(freq, dif_vac_sea);



%