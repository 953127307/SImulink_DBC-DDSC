run("S3_simulation_verify.m")

out = sim("S4.slx");

t = out.tout;
y_d = squeeze(out.y_d.Data);
NN_x = squeeze(out.x.Data);
NN_e = squeeze(out.e.Data);
NN_x_1 = NN_x(1,:);
NN_x_2 = NN_x(2,:);
NN_x_3 = NN_x(3,:);
NN_e_1 = NN_e(1,:);
NN_e_2 = NN_e(2,:);
NN_e_3 = NN_e(3,:);
NN_u = squeeze(out.u.Data);
NN_V = squeeze(out.V.Data);

error_2 = squeeze(out.error_2.Data);
error_3 = squeeze(out.error_3.Data);

error_2(end)
error_3(end)