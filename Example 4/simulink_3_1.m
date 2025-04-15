%#ok<*SAGROW>
clear;
clc
close all;

%% 导入参数
run('parameters.m')

Time = 10;
% % % 
r2 = 0.2;
beta_1=50;beta_2=20;
b_1=1.2;b_2=0.2;

dalpha_1=0;dalpha_1_dx_1=0;


r_1=0.1;r_2=0.05;
tau_1=0.5;tau_2=0.05;
x_1=0.5;x_2=-0.5;
delta = 0.02;

step = 0.001;
t = 0:step:Time;
x_d_op = 0.2*sin(t);
T0 = 0.01;
t0 = 0:T0:Time;
x_d_sample = 0.2*sin(t0);
interval = T0/step;
p_num=6;
p = p_num*ones(1,3);
K = 60;
Z = 42;
r = 0.0001;

% 第二阶DNN参数
ps = 10;
pa_2.Learning_rate = r2;
pa_2.theta_max = 2;
pa_2.epsilion = 0.1;
pa_2.Gamma = 1;
pa_2.L0 = 3+1;
pa_2.L1 = ps;
pa_2.L2 = ps;
pa_2.L3 = ps;
pa_2.L4 = 1;
pa_2.L = [pa_2.L0;pa_2.L1;pa_2.L2;pa_2.L3;pa_2.L4];
pa_2.size = 0;
for i = 2:length(pa_2.L)
    pa_2.size = pa_2.size + pa_2.L(i)*pa_2.L(i-1);
end
theta_2 = 0.5*rand(pa_2.size,1);
network = @DNN3;
n_order = 2;
sw = 0;
co = 0;

%% 系统模型--二阶系统
while sw == 0
    co = co + 1;
    sw = 1;
    k = 0;
    
    for i = 1:length(t)
    %% 显示时间
        if t(i) == 0
            fprintf('t: ');
        end
        if mod(i-1,0.1/step) == 0
            fprintf('%0.1f ',(i-1)/(1/step));
        end
        if t(i) == Time
            fprintf('\n');
        end

%% 预测轨迹   
%         if mod(i,interval) == 0 || k==0
%             k = k+1;
% 
%             if k < 2
%                 Y_pre2_Next = x_d_sample(k);
%             else
%                 Y_pre2_Last = Y_pre2_Next;
%                 if k < K
% % 训练集划分
%                     X_train = x_d_sample(1:k-1);
%                     Y_train = x_d_sample(2:k);
%                     X_P = x_d_sample(k); 
% % 归一化
%                     [X_train_Nor,option_X]=mapminmax(X_train);
%                     [Y_train_Nor,option_Y]=mapminmax(Y_train);
%                     X_P_Nor = mapminmax('apply',X_P,option_X);% 对样本数据进行归一化
% % 构建DNN并训练
%                     net=feedforwardnet(p,'trainlm');
%                     net.trainParam.lr = r;  % 设置学习率
%                     net.trainParam.goal = 1e-6;
%                     net.trainParam.showWindow = false;
%                     net=train(net,X_train_Nor,Y_train_Nor);
% % 计算下一节点的预测值
%                     Y=sim(net,X_P_Nor);
%                     Y_pre2_Next = mapminmax('reverse',Y,option_Y);
%                 else
%                     D_L = 1; D_U = Z-1;
%                     while abs(D_U-D_L) > 35
% % 利用黄金分割法计算上下边界
%                         D_1 = ceil(D_L + 0.382 * (D_U - D_L));
%                         D_2 = floor(D_L + 0.618 * (D_U - D_L));
% % 定义训练，测试集     
%                         for j = 1:K-D_1
%                             X_train_1(:,j) = x_d_sample(k-K+j:k-K+D_1+j-1)';
%                             Y_train_1(:,j) = x_d_sample(k-K+D_1+j)';
%                         end
%                         for j = 1:K-D_2
%                             X_train_2(:,j) = x_d_sample(k-K+j:k-K+D_2+j-1)';
%                             Y_train_2(:,j) = x_d_sample(k-K+D_2+j)';
%                         end
%                         for j = 1:Z-D_1
%                             X_test_1(:,j) = x_d_sample(k-Z+j:k-Z+D_1+j-1)';
%                             Y_test_1(:,j) = x_d_sample(k-Z+D_1+j)';
%                         end
%                         for j = 1:Z-D_2
%                             X_test_2(:,j) = x_d_sample(k-Z+j:k-Z+D_2+j-1)';
%                             Y_test_2(:,j) = x_d_sample(k-Z+D_2+j)';
%                         end
% % 归一化
%                         [X_train_1Nor,option_trainX_1]=mapminmax(X_train_1);
%                         [X_train_2Nor,option_trainX_2]=mapminmax(X_train_2);
%                         [Y_train_1Nor,option_trainY_1]=mapminmax(Y_train_1);
%                         [Y_train_2Nor,option_trainY_2]=mapminmax(Y_train_2);
%                         [X_test_1Nor,option_testX_1]=mapminmax(X_test_1);
%                         [X_test_2Nor,option_testX_2]=mapminmax(X_test_2);
% % 构建DNN并训练
%                         net1=feedforwardnet(p,'trainlm');
%                         net1.trainParam.lr = r;  % 设置学习率
%                         net1.trainParam.showWindow = false;
%                         net1.trainParam.goal = 1e-8;
%                         net1=train(net1,X_train_1Nor,Y_train_1Nor);
% 
%                         net2=feedforwardnet(p,'trainlm');% 建立模型，传递函数使用purelin，采用梯度下降法训练
%                         net2.trainParam.lr = r;  % 设置学习率
%                         net2.trainParam.showWindow = false;
%                         net2.trainParam.goal = 1e-8;
%                         net2=train(net2,X_train_2Nor,Y_train_2Nor);
% % 计算测试集的预测值  
%                         Y_1=net1(X_test_1Nor);
%                         Y_1_pre = mapminmax('reverse',Y_1,option_trainY_1);
%                         Y_2=net2(X_test_2Nor);
%                         Y_2_pre = mapminmax('reverse',Y_2,option_trainY_2);
% % 计算性能指标
%                         f_p_1 = 1/(Z-D_1)*norm(Y_1_pre-Y_test_1)^2;
%                         f_p_2 = 1/(Z-D_2)*norm(Y_2_pre-Y_test_2)^2;
% % 更新最优维度
%                         if f_p_1 < f_p_2
%                             D_U = D_2; D = D_1; net = net1;
%                             option_X = option_trainX_1;
%                             option_Y = option_trainY_1;
%                         else
%                             D_L = D_1; D = D_2; net = net2;
%                             option_X = option_trainX_2;
%                             option_Y = option_trainY_2;
%                         end
%                         clear X_train_1 Y_train_1 X_test_1 Y_test_1;
%                         clear X_train_2 Y_train_2 X_test_2 Y_test_2;
%                     end
%                     X_P = x_d_sample(k-D+1:k)';
%                     X_P_Nor = mapminmax('apply',X_P,option_X);% 对样本数据进行归一化
%                     Y = net(X_P_Nor);
%                     Y_pre2_Next = mapminmax('reverse',Y,option_Y);
%                 end
%             end
%         end
% % 预测,引入平滑因子
%         if k < 2
%             Y_pre(i) = x_d_sample(k);
%             dx_d(i) = 0;
%             %plot(t(1:i),Y_pre(1:i),'b-','MarkerSize',1.5);
%         else
%             Y_pre(i) = Y_pre2_Last+(Y_pre2_Next-Y_pre2_Last)*cos(pi/2*sin(pi/(2*T0)*(t(i)-k*T0))^n_order)^n_order;
%             dx_d(i) = -(1/(4*T0))*n_order^2*pi^2*(-Y_pre2_Last + Y_pre2_Next)...
%                       *cos(pi*(t(i) - k*T0)/(2*T0))*cos(1/2*pi*sin(pi*(t(i) - k*T0)/(2*T0))^n_order)^(n_order-1)...
%                       *sin(pi*(t(i) - k*T0)/(2*T0))^(n_order-1)*sin(1/2*pi*sin((pi*(t(i) - k*T0)/(2*T0))^n_order));
%             %plot(t(1:i),Y_pre(1:i),'b-','MarkerSize',1.5);
%         end
%         x_d(i) = Y_pre(i);

% 系统模型   
    % 非线性函数
    M = 1;
    F = 1;
    Q = 0;
    G = 10;
    f_1(i) = 0;
    f_2(i) = -1/M*(F*x_2(i)+Q*x_2(i)+G);


    % 第一阶误差
    e_1(i) = x_1(i) - x_d(i); 

    % 两个C^n函数
    if abs(e_1(i)) > delta
        Upsilon_2(i) = (abs(e_1(i))-delta)^2/2;
    else
        Upsilon_2(i) = 0;
    end

    if abs(e_1(i)) > delta
        Lambda_2(i) = sign(e_1(i));
    else
        Lambda_2(i) = 1-2*cos(pi/2*sin(pi/(4*delta)*(e_1(i)+delta))^2)^2;
    end

    % 第一阶DNN
    e_temp1(i) = Upsilon_2(i)*Lambda_2(i)*2;
    % 第一阶tau
    dtau_1(i) = r_1*Upsilon_2(i)*2;

    % 第一阶虚拟控制器
    alpha_1(i) = -(beta_1+1/4)*e_temp1(i) ...
                 -(tau_1(i)+b_1)*Lambda_2(i)+dx_d(i);
    % 第二阶误差       
    e_2(i) = x_2(i) - alpha_1(i);

    % 两个C^n函数
    if abs(e_2(i)) > delta
        Upsilon_1(i) = abs(e_2(i))-delta;
    else
        Upsilon_1(i) = 0;
    end

    if abs(e_2(i)) > delta
        Lambda_1(i) = sign(e_2(i));
    else
        Lambda_1(i) = 1-2*cos(pi/2*sin(pi/(4*delta)*(e_2(i)+delta)));
    end

    % 第二阶DNN
    e_temp2(i) = Upsilon_1(i)*Lambda_1(i);

    if i > 1
        dalpha_1(i) = (alpha_1(i)-alpha_1(i-1))/step;
        dalpha_1_dx_1(i) = (alpha_1(i)-alpha_1(i-1))/(x_1(i)-x_1(i-1));
    end
    varrho_1(i) = dalpha_1(i)-dalpha_1_dx_1(i)*(x_2(i)+f_1(i));

    input_2 = [x_1(i);x_2(i);dalpha_1(i)];
    [Theta_2(i),dtheta_2(:,i),Weight_norm(:,i)] = network(input_2,e_temp2(i),theta_2(:,i),pa_2);
    % 第二阶tau
    dtau_2(i) = r_2*Upsilon_1(i);
    % 实际控制器
    u(i) =M*(-(beta_2+1)*e_temp2(i) ...
                 -Theta_2(i)-(tau_2(i)+b_2)*Lambda_1(i));

    dx_1(i) = f_1(i) + x_2(i);
    dx_2(i) = f_2(i) + 1/M*u(i);

    if i ~= length(t)
        x_1(i+1) = sum(dx_1)*step+x_1(1);
        x_2(i+1) = sum(dx_2)*step+x_2(1);
        tau_1(i+1) = sum(dtau_1)*step+tau_1(1);
        tau_2(i+1) = sum(dtau_2)*step+tau_2(1);
        theta_2(:,i+1) = sum(dtheta_2,2)*step+theta_2(:,1);
    end 

    if abs(x_d_op(i)-x_1(i)) > 10
        sw = 1;
        break;
    end

        if t(i) >= 0.6
            if abs(x_d_op(i)-x_d(i)) > 0.1*delta
                sw = 0;
                clc;
                fprintf('%d:%f \n',co,t(i));    
                break;
            end
        end
    end
end

save('data.mat','x_d','-append');
save('data.mat','x_d_op','-append');
save('data.mat','dx_d','-append');
save('data.mat','x_1','-append');
save('data.mat','tau_1','-append');
save('data.mat','tau_2','-append');
save('data.mat','Weight_norm','-append');
save('data.mat','u','-append');
save('data.mat','t','-append');
% hold on

% plot(t,x_d_op)
% run('Fig9.m')

% x_1-x_d_op
% e_1_op
% u
% tau_1-tau_2
% theta
% clear x_1 x_2 tau_1 tau_2 theta_1 theta_2 dtheta_1 dtheta_2 dx_1 dx_2;
% clear dtau_1 dtau_2 e_1 e_2 f_1 f_2 Theta_1 Theta_2 u alpha_1;