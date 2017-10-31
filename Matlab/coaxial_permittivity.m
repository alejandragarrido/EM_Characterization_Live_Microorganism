%% Coaxial phisic parameters
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
c = 3e8;                                %[m/s] light speed
b = 2*pi.*f.*(sqrt(e_rea))/c;           % beta
a = 60*pi*sgm./sqrt(e_rea);              % alfa
S21 = exp(-1i*b*z).*exp(-a*z);           % S parameter (2->1)




%