function [ r_coa ] = coaxial_geometry( r_cob, z_cox )
%UNTITLED4 Summary of this function goes here
%r_cob [mm] radi ext coaxial
%z_cox [ohms] vacuum impedance
r_coa = r_cob/(exp(z_cox/60));

end

