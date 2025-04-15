run("S3_simulation_verify.m")

out = sim("S4.slx");

t = out.tout;
y_d = squeeze(out.y_d.Data);
NN_x = squeeze(out.x.Data);
NN_e_alpha_1 = squeeze(out.e_alpha_1.Data);
NN_x_1 = NN_x(:,1);
NN_x_2 = NN_x(:,2);
NN_u = squeeze(out.u.Data);
NN_V = squeeze(out.V.Data);
error_1 = squeeze(out.error_1.Data);
error_2 = squeeze(out.error_2.Data);

error_1(end)
error_2(end)