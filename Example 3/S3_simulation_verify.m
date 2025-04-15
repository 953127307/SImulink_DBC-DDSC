clear;
clc
close all;

Lambda_1 = [12,6,6];
Lambda_2 = [12,6,6];
Omega_1 = [0.005,0.005,0.01];

for i=1:3

    pam.lambda_1 = Lambda_1(i);
    pam.lambda_2 = Lambda_2(i);
    pam.omega_1 = Omega_1(i);

    run("S2_calculate_parameters.m")

    out = sim("S3.slx");

    S{i} = double(s);
    varpa_1(i) = double(sigma_1);
    varpa_2(i) = double(sigma_2);
    S_min(i) = min(eig(S{i}));
    
    t = out.tout;
    y_d = squeeze(out.y_d.Data);
    x = squeeze(out.x.Data);
    e = squeeze(out.e.Data);
    x_1(:,i) = x(:,1);
    x_2(:,i) = x(:,2);
    e_1(:,i) = e(1,:);
    e_2(:,i) = e(2,:);
    e_alpha_1(:,i) = e(3,:);
    alpha_1(:,i) = squeeze(out.alpha_1.Data);
    u(:,i) = squeeze(out.u.Data);
    V(:,i) = squeeze(out.V.Data);
    V_bound(:,i) = sqrt(1/S_min(i)*ones(1,length(t)));
    f_1(:,i) = squeeze(out.f_1.Data);
    f_2(:,i) = squeeze(out.f_2.Data);
    hat_f_1(:,i) = squeeze(out.hat_f_1.Data);
    hat_f_2(:,i) = squeeze(out.hat_f_2.Data);
end
pam.hat_theta_1
pam.hat_theta_2
S
varpa_1
varpa_2
bound = sqrt(1./S_min)