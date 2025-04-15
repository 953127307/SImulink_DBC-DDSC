    %% RLS参数估计示例
clear; clc;

% 生成合成数据
rng(42); % 固定随机种子
n = 2; % 参数维度
theta_true = [2.0; 1.0]; % 真实参数
N = 100; % 数据点数量
X = randn(N, n); % 输入矩阵
y = X * theta_true + 0.1*randn(N,1); % 带噪声的观测输出

% RLS初始化
lambda = 1.0; % 遗忘因子（1表示无遗忘）
delta = 1000; % 协方差矩阵初始化参数
theta_hat = zeros(n,1); % 参数估计初始化
P = delta * eye(n); % 初始协方差矩阵

% RLS递归过程
for t = 1:N
    x_t = X(t,:)'; % 当前输入向量（列向量）
    y_t = y(t); % 当前观测值
    
    % 计算先验误差
    e = y_t - x_t' * theta_hat;
    
    % 计算增益矩阵
    K = (P * x_t) / (lambda + x_t' * P * x_t);
    
    % 更新参数估计
    theta_hat = theta_hat + K * e;
    
    % 更新协方差矩阵
    P = (P - K * x_t' * P) / lambda;
end

%% 结果显示
disp('真实参数:');
disp(theta_true');
disp('估计参数:');
disp(theta_hat');