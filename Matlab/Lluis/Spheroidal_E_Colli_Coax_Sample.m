%   Spheroidal Model for E colli

clear all
close all


% Frequency range
%f_min=0.5*1e5;
%f_min=1.0*1e6;
f_min=1.0*1e4;
f_max=3.0*1e9;
%N_f=5001;
N_f=1003;
%del_f=(f_max-f_min)/(N_f-1);
eps_ssp(1:N_f)=0+0*1i;
Frq=logspace(log10(f_min),log10(f_max),N_f);

% Dimensions and Permitivities of the different layers
% Constant with frequency
rad_z=2*1e-6;
rad_x=0.5*1e-6;
rad_y=0.5*1e-6;
axr=rad_z/rad_x;
thk_om=7*1e-9;
thk_im=7*1e-9;
thk_pp=10*1e-9;
eps_0=8.854*1e-12;
vol_rt=0.1;
%eps_ssp(N_f)=0+0*1i;

for n_f=1:N_f
    %frq=f_min+(n_f-1)*del_f;
    frq=Frq(n_f);
    X(n_f)=frq;
%Variable with frequency
eps_md(n_f)=81-1i*(0.35/(2*pi*frq*eps_0));
eps_om(n_f)=10-1i*0;
eps_pp(n_f)=60-1i*(3/(2*pi*frq*eps_0));
eps_im(n_f)=6-1i*(0/(2*pi*frq*eps_0));
eps_cp(n_f)=100-1i*(0.22/(2*pi*frq*eps_0));

% Volume ratios
vol_1(n_f)=(rad_z-thk_om)*(rad_x-thk_om)^2/(rad_z*rad_x^2);
vol_2(n_f)=(rad_z-thk_om-thk_pp)*(rad_x-thk_om-thk_pp)^2/((rad_z-thk_om)*(rad_x-thk_om)^2);
vol_3(n_f)=(rad_z-thk_om-thk_pp-thk_im)*(rad_x-thk_om-thk_pp-thk_im)^2/((rad_z-thk_om-thk_pp)*(rad_x-thk_om-thk_pp)^2);

% Depolarization factors
alp_z(n_f)=(-(1/(axr^2-1)))+(axr/((axr^2-1)^(1.5)))*log(axr+sqrt(axr^2-1));
alp_x(n_f)=0.5*(1-alp_z(n_f));
alp_y(n_f)=0.5*(1-alp_z(n_f));
bet_x(n_f)=((1-alp_x(n_f))/alp_x(n_f));
bet_y(n_f)=((1-alp_y(n_f))/alp_y(n_f));
bet_z(n_f)=((1-alp_z(n_f))/alp_z(n_f));

% Equivalent Complex Relative Permittivities


eps_mx(n_f)=eps_im(n_f)*(((bet_x(n_f)*(1-vol_3(n_f))*eps_im(n_f))+((1+bet_x(n_f)*vol_3(n_f))*eps_cp(n_f)))/(((bet_x(n_f)+vol_3(n_f))*eps_im(n_f))+((1-vol_3(n_f))*eps_cp(n_f))));
eps_my(n_f)=eps_im(n_f)*(((bet_y(n_f)*(1-vol_3(n_f))*eps_im(n_f))+((1+bet_y(n_f)*vol_3(n_f))*eps_cp(n_f)))/(((bet_y(n_f)+vol_3(n_f))*eps_im(n_f))+((1-vol_3(n_f))*eps_cp(n_f))));
eps_mz(n_f)=eps_im(n_f)*(((bet_z(n_f)*(1-vol_3(n_f))*eps_im(n_f))+((1+bet_z(n_f)*vol_3(n_f))*eps_cp(n_f)))/(((bet_z(n_f)+vol_3(n_f))*eps_im(n_f))+((1-vol_3(n_f))*eps_cp(n_f))));

eps_qx(n_f)=eps_pp(n_f)*(((bet_x(n_f)*(1-vol_2(n_f))*eps_pp(n_f))+((1+bet_x(n_f)*vol_2(n_f))*eps_mx(n_f)))/(((bet_x(n_f)+vol_2(n_f))*eps_pp(n_f))+((1-vol_2(n_f))*eps_mx(n_f))));
eps_qy(n_f)=eps_pp(n_f)*(((bet_y(n_f)*(1-vol_2(n_f))*eps_pp(n_f))+((1+bet_y(n_f)*vol_2(n_f))*eps_my(n_f)))/(((bet_y(n_f)+vol_2(n_f))*eps_pp(n_f))+((1-vol_2(n_f))*eps_my(n_f))));
eps_qz(n_f)=eps_pp(n_f)*(((bet_z(n_f)*(1-vol_2(n_f))*eps_pp(n_f))+((1+bet_z(n_f)*vol_2(n_f))*eps_mz(n_f)))/(((bet_z(n_f)+vol_2(n_f))*eps_pp(n_f))+((1-vol_2(n_f))*eps_mz(n_f))));

eps_px(n_f)=eps_om(n_f)*(((bet_x(n_f)*(1-vol_1(n_f))*eps_om(n_f))+((1+bet_x(n_f)*vol_1(n_f))*eps_qx(n_f)))/(((bet_x(n_f)+vol_1(n_f))*eps_om(n_f))+((1-vol_1(n_f))*eps_qx(n_f))));
eps_py(n_f)=eps_om(n_f)*(((bet_y(n_f)*(1-vol_1(n_f))*eps_om(n_f))+((1+bet_y(n_f)*vol_1(n_f))*eps_qy(n_f)))/(((bet_y(n_f)+vol_1(n_f))*eps_om(n_f))+((1-vol_1(n_f))*eps_qy(n_f))));
eps_pz(n_f)=eps_om(n_f)*(((bet_z(n_f)*(1-vol_1(n_f))*eps_om(n_f))+((1+bet_z(n_f)*vol_1(n_f))*eps_qz(n_f)))/(((bet_z(n_f)+vol_1(n_f))*eps_om(n_f))+((1-vol_1(n_f))*eps_qz(n_f))));


%Maxwell- Wagner expressions

eps_inx(n_f)=((eps_px(n_f)-eps_md(n_f))/(alp_x(n_f)*eps_px(n_f)+(1-alp_x(n_f))*eps_md(n_f)));
eps_iny(n_f)=((eps_py(n_f)-eps_md(n_f))/(alp_y(n_f)*eps_py(n_f)+(1-alp_y(n_f))*eps_md(n_f)));
eps_inz(n_f)=((eps_pz(n_f)-eps_md(n_f))/(alp_z(n_f)*eps_pz(n_f)+(1-alp_z(n_f))*eps_md(n_f)));


eps_ssp(n_f)=eps_md(n_f)*((((2/9)*vol_rt)*((eps_inx(n_f))+(eps_iny(n_f))+(eps_inz(n_f))))+1)/(1-((vol_rt/9)*(eps_inx(n_f)+eps_iny(n_f)+eps_inz(n_f))));
Num_1(n_f)=(((2/9)*vol_rt)*((eps_inx(n_f))+(eps_iny(n_f))+(eps_inz(n_f))));
Den_1(n_f)=((vol_rt/9)*(eps_inx(n_f)+eps_iny(n_f)+eps_inz(n_f)));
eps_ssp_1(n_f)=eps_md(n_f)*(Num_1(n_f)+1)/(1-Den_1(n_f));
eps_rea(n_f)=real (eps_ssp(n_f));
sgm(n_f)=imag(eps_ssp(n_f)*2*pi*frq*eps_0);
%eps_ssp(n_f)=eps_md(n_f)*(((2/9)*vol_rt)*((eps_inx(n_f)+1)+(eps_iny(n_f)+1)+(eps_inz(n_f)+1))+1)/(1-((vol_rt/9)*(eps_inx(n_f)+eps_iny(n_f)+eps_inz(n_f))))
end


figure('Name', 'eps_real');
semilogx(X, eps_rea)

figure('Name', 'sigma');
semilogx(X,-sgm)


%% Calculation of the S parameters of a Coaxial Sample according to Single Dielectric Slab
%% Rutgers, 4.4, pag. 91-94
eps_a=1;
eta_a=sqrt(eps_a);
eps_b=1;
eta_b=sqrt(eps_b);
lgt_1=10*1e-3;

for n_f=1:N_f
    %frq=f_min+(n_f-1)*del_f;
    frq=Frq(n_f);
    X(n_f)=frq;
    eps_1=eps_ssp(n_f);
    eta_1=sqrt(eps_1);
    k_1=(2*pi*frq*eta_1)/(3.0*1e8);
    rho_1=(eta_1-eta_a)/(eta_1+eta_a);
    rho_2=(eta_b-eta_1)/(eta_b+eta_1);
    tau_1=1+rho_1;
    tau_2=1+rho_2;
    num=(rho_1+rho_2*exp(-2*1i*k_1*lgt_1));
   
    denom=(1+rho_1*rho_2*exp(-2*1i*k_1*lgt_1));
  
    S_11(n_f)=(rho_1+rho_2*exp(-2*1i*k_1*lgt_1))/(1+rho_1*rho_2*exp(-2*1i*k_1*lgt_1));
    S_12(n_f)=(tau_1*tau_2*exp(-1i*k_1*lgt_1))/(1+rho_1*rho_2*exp(-2*1i*k_1*lgt_1));
    
    S_11_amp(n_f)=abs(S_11(n_f));
    S_11_phs(n_f)=(180/pi)*angle(S_11(n_f));
    S_12_amp(n_f)=abs(S_12(n_f));
    S_12_phs(n_f)=(180/pi)*angle(S_12(n_f));

end
figure('Name', 'S_11_amp');
semilogx(X, S_11_amp)

figure('Name', 'S_11_phs');
semilogx(X,S_11_phs)


figure('Name', 'S_12_amp');
semilogx(X, S_12_amp)

figure('Name', 'S_12_phs');
semilogx(X,S_12_phs)


