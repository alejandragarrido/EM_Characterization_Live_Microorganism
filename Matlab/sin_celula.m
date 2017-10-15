%Y11 contiene las frecuencias y las admitancias en funcion de la distancia
d1 = 1e-9:1e-9:20e-9;
s = 5e-6;
% f = Y11(1,:); %Para coger las frencuencias de la simulacion
% Y = Y11(:, :);
% Y(:,1) = [];

permitivity = -(Y11./(2*pi.*f.*Co)).*1i;
