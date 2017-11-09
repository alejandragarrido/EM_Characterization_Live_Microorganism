function [S21_modul, S21_fase] = S21( eps_rea, sgm, z, w)
% w : angular frequency [rad/s]
% c : light speed 3e8 [m/s]
% z : thickness (3e-3 [m] )
	
b = w.*(sqrt(eps_rea))/c;                              % beta
a= 60*pi*sgm./sqrt(eps_rea);                           % alfa
S21 = exp(-1i.*b.*z).*exp(-a.*z);                      % S parameter (2->1)
S21_modul = abs(S21);                                  % [W]
S21_fase = angle(S21);                                 % [rad]

end

