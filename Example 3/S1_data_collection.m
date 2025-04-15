%#ok<*SAGROW>
out = sim("S1.slx");

%% 数据集划分
X_0 = squeeze(out.x.Data);
X_1 = squeeze(out.dot_x.Data);
X_01 = X_0(1,:);
X_02 = X_0(2,:);
X_11 = X_1(1,:);
X_12 = X_1(2,:);
Z_01 = squeeze(out.z_1.Data);
Z_02 = squeeze(out.z_2.Data);
U = squeeze(out.u.Data)';

% save("data.mat","X_01","X_11","Z_01",'X_02',"X_12","Z_02","U");