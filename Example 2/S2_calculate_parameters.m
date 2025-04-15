run("S1_data_collection.m")

pam.lambda_1 = 6;
pam.lambda_2 = 6;
pam.lambda_3 = 6;

A_e = [-pam.lambda_1,1,0;0,-pam.lambda_2,1;0,0,-pam.lambda_3];

pam.S = lyap(A_e',eye(3));

tau = 1/max(eig(pam.S))

%% 数据驱动
D_2 = [Z_02;X_12];
Q_2 = [-eye(2);zeros(1,2)];

G_2 = D_2'/(D_2*D_2')*Q_2;
pam.hat_theta_2 = round((X_03*G_2)',4);

D_3 = [Z_03;X_13];
Q_3 = [-eye(2);zeros(1,2)];

G_3 = D_3'/(D_3*D_3')*Q_3;
pam.hat_theta_3 = round((U*G_3)',4);