run("S1_data_collection.m")

%% 数据驱动
D_1 = [Z_01;X_11];
Q_1 = [-eye(2);zeros(1,2)];

G_1 = D_1'/(D_1*D_1')*Q_1;
pam.hat_theta_1 = round((X_02*G_1)',4);

D_2 = [Z_02;X_12];
Q_2 = [-eye(3);zeros(1,3)];

G_2 = D_2'/(D_2*D_2')*Q_2;
pam.hat_theta_2 = round((U*G_2)',4);

%% 控制
mu = 0;
delta = sqrt(6);
xi_0 = mu*sqrt(1+delta^2);

pam.lambda_1 = 20;
pam.lambda_2 = 20;
pam.omega_1 = 0.002;

L_e = [-pam.lambda_1,0];
L_alpha = [1];
L = [eye(2),zeros(2,1);L_e,L_alpha];
L_Inv = eye(3)/L;

A_11 = [-pam.lambda_1,0;0,-pam.lambda_2]; % 2x2
A_12 = [eye(1);zeros(1,1)]; % 2x1
A_22 = [-1/pam.omega_1]; % 1
A = [A_11,A_12;zeros(1,2),A_22]; % [2x2 2x1
                                 %  1x2 1x1]

A_L = L_Inv*A;

m_1 = length(pam.hat_theta_1);
M_1 = m_1;

Theta_1 = [pam.hat_theta_1'];
B_1 = [zeros(2,M_1);Theta_1];
B_1L = L_Inv*B_1;

B_2 = [zeros(2,1);1];
B_2L = L_Inv*B_2;

B_xi = [B_1L,B_2L];
tilde_B_xi = B_xi*xi_0;

under_A_11 = [-pam.lambda_1 ,1];
C_gamma = [under_A_11,L_alpha];
tilde_C_gamma = delta*C_gamma;

%% YALMIP
S = sdpvar(3,3,'symmetric');
sdpvar sigma_1 sigma_2 eps;
obj = -min(eig(S));

Equ = [A_L'*S+S*A_L+sigma_1*S+sigma_2*(tilde_C_gamma'*tilde_C_gamma),S*B_1L,S*tilde_B_xi;
       B_1L'*S,-sigma_2*eye(M_1),zeros(M_1,M_1+1);
       tilde_B_xi'*S,zeros(M_1+1,M_1),-sigma_1*eye(M_1+1)];
Constraints = [S >= exp(eps)*eye(3),sigma_1 >= exp(eps),...
                sigma_2 >= exp(eps),Equ<=-exp(eps)*eye(3+2*M_1+1)];

options = sdpsettings('verbos',0);
sol = solvesdp(Constraints,obj,options);

S = double(S);
sigma_1 = double(sigma_1);
sigma_2 = double(sigma_2);
S_min = min(eig(S));
