%#ok<*SAGROW>
clear;
clc
close all;
D = [0,0.05,0.1,0.15];
for i=1:length(D)
    pam.d = D(i);
    run("S2_calculate_parameters.m")
    out = sim("S3.slx");
    
    t = out.tout;
    y_d = squeeze(out.y_d.Data);
    x = squeeze(out.x.Data);
    e = squeeze(out.e.Data);
    x_1(:,i) = x(1,:);
    x_2(:,i) = x(2,:);
    x_3(:,i) = x(3,:);
    e_1(:,i) = e(1,:);
    e_2(:,i) = e(2,:);
    e_3(:,i) = e(3,:);
    u(:,i) = squeeze(out.u.Data);
    V(:,i) = squeeze(out.IAC.Data);
    error_2(:,i) = squeeze(out.error_2.Data);
    error_3(:,i) = squeeze(out.error_3.Data);
end

error_2(end,:)
error_3(end,:)
 