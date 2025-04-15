run("S2_calculate_parameters.m")
S = {pam.S_1,pam.S_2,pam.S_3};
Tau = [tau_1,tau_2,tau_3];
Lambda_1 = [pam.lambda_1_1;pam.lambda_2_1;pam.lambda_3_1];
Lambda_2 = [pam.lambda_1_2;pam.lambda_2_2;pam.lambda_3_2];

for i=1:3
    pam.lambda_1 = Lambda_1(i);
    pam.lambda_2 = Lambda_2(i);
    pam.S = S{i};
    tau = Tau(i);
    
    out = sim("S3.slx");

    t = out.tout;
    y_d = squeeze(out.y_d.Data);
    x = squeeze(out.x.Data);
    e = squeeze(out.e.Data);
    x_1(:,i) = x(1,:);
    x_2(:,i) = x(2,:);
    e_1(:,i) = e(1,:);
    e_2(:,i) = e(2,:);
    alpha_1(:,i) = squeeze(out.alpha_1.Data);
    f_1(:,i) = squeeze(out.f_1.Data);
    f_2(:,i) = squeeze(out.f_2.Data);
    hat_f_1(:,i) = squeeze(out.hat_f_1.Data);
    hat_f_2(:,i) = squeeze(out.hat_f_2.Data);
    u(:,i) = squeeze(out.u.Data);
    V(:,i) = squeeze(out.V.Data);
    V_up(:,i) = V(1,i)*exp(-tau*t);
end
% figure(1)
% hold on
% plot(t,y_d);
% plot(t,x_1);
% 
% figure(2)
% hold on
% plot(t,e_1);
% plot(t,e_2);