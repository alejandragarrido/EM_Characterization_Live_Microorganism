d1 = 1e-9:1e-9:20e-9;
Y = Y11;
s = 5e-6;
Co = (8.85*10e-12*(s*s))./d1;
f = Y11(:,1); %frequencia [MHz]

Y(:,1) = []; %Admitancia 
Y(:,21) = []; 

permitivity = -(Y./(2*pi.*f.*Co)).*1i;
  
real_permitivity = real(permitivity);
real_permitivity_norm = real_permitivity/max(real_permitivity);

figure 
plot(f, real_permitivity_norm);

imag_permitivity = imag(permitivity);
imag_permitivity_norm = imag_permitivity/max(imag_permitivity);

figure 
plot(f, imag_permitivity_norm);
