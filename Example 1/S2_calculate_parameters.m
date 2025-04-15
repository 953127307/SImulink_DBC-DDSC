run("S1_data_collection.m")

%% 权重估计
D_1 = [Z_01;X_11];
Q_1 = [-eye(2);zeros(1,2)];

G_1 = D_1'/(D_1*D_1')*Q_1
pam.hat_theta_1 = round((X_02*G_1)',4);

D_2 = [Z_02;X_12];
Q_2 = [-eye(5);zeros(1,5)];

G_2 = D_2'/(D_2*D_2')*Q_2;
pam.hat_theta_2 = round((U*G_2)',4);

%% 控制增益
pam.lambda_1_1 = 1.5;
pam.lambda_1_2 = 1.5;

A_e_1 = [-pam.lambda_1_1,1;0,-pam.lambda_1_2];

pam.S_1 = lyap(A_e_1',eye(2))

tau_1 = 1/max(eig(pam.S_1))

pam.lambda_2_1 = 2;
pam.lambda_2_2 = 2;

A_e_2 = [-pam.lambda_2_1,1;0,-pam.lambda_2_2];

pam.S_2 = lyap(A_e_2',eye(2))

tau_2 = 1/max(eig(pam.S_2))

pam.lambda_3_1 = 2.5;
pam.lambda_3_2 = 2.5;

A_e_3 = [-pam.lambda_3_1,1;0,-pam.lambda_3_2];

pam.S_3 = lyap(A_e_3',eye(2))

tau_3 = 1/max(eig(pam.S_3))
