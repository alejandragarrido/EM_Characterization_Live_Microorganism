s = 5e-6;
d = 5e-6;

%% Condensador con distancia parametrizada
load('Y_sin_celula_steps.mat');

Y(:,1) = []; %Admitancia 
Y(:,21) = [] ;

d1 = 1e-9:1e-9:20e-9;
Co = (8.85*10e-12*(s*s))./d1;
permitivity = -(Y./(2*pi.*freq.*Co)).*1i;


real_permitivity = real(permitivity);
real_permitivity_norm = real_permitivity/max(real_permitivity);

figure 
plot(f, real_permitivity_norm);

imag_permitivity = imag(permitivity);
imag_permitivity_norm = imag_permitivity/max(imag_permitivity);

figure 
plot(f, imag_permitivity);

%% Condensador sin paramatrizar (diferencia entre condensador con celula y condensador sin celula)




%permittivity = (Y./(var*Co*1i));
%permittivity_real = real(permittivity);
%permittivity_img = imag(permittivity);
% real_permitivity_sin = real(permitivity_sin);
% real_permitivity_norm_sin = real_permitivity_sin/max(real_permitivity_sin);
% 
% imag_permitivity_sin = imag(permitivity_sin);
% imag_permitivity_norm_sin = imag_permitivity_sin/max(imag_permitivity_sin);
% 
% real_permitivity_con = real(permitivity_con);
% real_permitivity_norm_con = real_permitivity_con/max(real_permitivity_con);
% 
% imag_permitivity_con = imag(permitivity_con);
% imag_permitivity_norm_con = imag_permitivity_con/max(imag_permitivity_con);


%dif_permitivity_real = abs(permitivity_con - permitivity_sin);
%dif_permitivity_imag = abs(permitivity_con - permitivity_sin );

%figure 
%plot(freq, dif_permitivity_real);

figure 
plot(FreqMHz, eps_real);

figure
plot(FreqMHz, eps_img);