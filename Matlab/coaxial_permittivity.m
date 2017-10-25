%% Coaxial phisic parameters
r_cob = 6;                                      % [mm] radi ext coaxial
r_coa = 2.61;                                   % [mm] radi int coaxial

%% Culture medium phisic parameters
g_pla = 1;                                      % [mm] gruix plastic cont

r_int = r_coa + g_pla;                          % [mm]  radi intern corona
r_ext = r_cob - g_pla;                          % [mm]  radi extern corona
h_cor = 1;                                      % [mm]  altura corona
% s_cor =                                       % [mm2] superficie corona
% v_cel = s_cor * h_cor;                        % [mm3] volum de coltiu
%% Electric Parameters
e_rel = 1;                                      % [adimensional] vacuum
% e_rel = ;                                     % [adimensional] water
% e_rel = ;                                     % [adimensional] cult_med
z_cox = 50;                                     % [ohms] vacuum impedance

%% Plot coaxial

figure('name', 'Coaxial with culture medium');

[x,y,z] = cylinder(r_cob +1);
h = hgtransform;
surf(x,y,z, 'Parent', h, 'FaceColor', 'r');
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
% e^-jkz = e^-jbz*e^az

% 