%#ok<*SAGROW>
clear;
clc
close all;
D = [0,0.05,0.10,0.15];
for i=1:length(D)
    pam.d = D(i);
    run("S2_calculate_parameters.m")
    out = sim("S3.slx");
    
    t = out.tout;
    y_d = squeeze(out.y_d.Data);
    x = squeeze(out.x.Data);
    x_1(:,i) = x(:,1);
    x_2(:,i) = x(:,2);
    e_alpha_1(:,i) = squeeze(out.e_alpha_1.Data);
    alpha_1(:,i) = squeeze(out.alpha_1.Data);
    u(:,i) = squeeze(out.u.Data);
    V(:,i) = squeeze(out.V.Data);
    V_bound(:,i) = sqrt(1/S_min*ones(1,length(t)));
    disp(pam.hat_theta_1);
    disp(pam.hat_theta_2);
    error_1(:,i) = squeeze(out.error_1.Data);
    error_2(:,i) = squeeze(out.error_2.Data);
end

error_1(end,:)
error_2(end,:)