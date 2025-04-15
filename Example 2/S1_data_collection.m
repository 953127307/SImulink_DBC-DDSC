out = sim("S1.slx");

%% 数据集划分
X_0 = squeeze(out.x.Data);
X_1 = squeeze(out.dot_x.Data);
X_02 = X_0(2,:);
X_03 = X_0(3,:);
X_12 = X_1(2,:);
X_13 = X_1(3,:);
Z_02 = squeeze(out.z_2.Data);
Z_03 = squeeze(out.z_3.Data);
U = squeeze(out.u.Data)';