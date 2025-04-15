run("S4_ABC_simulation.m")

color1 = 'r';
color2 = 'm';% 粉
color3 = [0.00, 0.45, 0.74];% 浅蓝
color4 = [0.93,0.69,0.13];% 浅黄
color5 = [053,183,119]/255;% 浅色
color6 = [62, 43, 109]/255;% 浅紫
color7 = 'k';% 黑

figure(1);

set(gcf,'position',[150 50 900 900])

subplot(3,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.73 0.7 0.25]);
hold on
box on
xlim ([0 10]);
xticks(0:2:10);
ylim ([-0.2 2]);
yticks(0:0.5:2);
xlabel({'(a) Time (Sec.)'});

plot(t,x_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_x_1,'Color',color6,'LineStyle','-','LineWidth',1.5);
plot(t,y_d,'Color',color1,'LineStyle','--','LineWidth',3);

legend({'$x_1$: Case 1' ...
        '$x_1$: Case 2', ...
        '$x_1$: Case 3', ...
        '$x_1$: Case 4', ...
        '$x_1$: Case 5', ...
        '$y_d$'}, ...
        'FontSize', 16, ...
        'NumColumns',2,...
        'Interpreter','latex');
% 在原图中绘制局部放大图
axes('position',[0.32 0.79 0.4 0.08],'FontSize',16); % 设置放大图的位置和尺寸
box on;
hold on;
plot(t,x_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_x_1,'Color',color6,'LineStyle','-','LineWidth',1.5);
plot(t,y_d,'Color',color1,'LineStyle','--','LineWidth',3);

xlim([8, 10]); % 设置x轴的范围
ylim([-0.005, 0.03]); % 设置y轴的范围
% xticks(1.4:0.1:1.6);
yticks(0:0.015:0.03);
ax = gca;
ax.YAxis.Exponent = -2;
% 添加箭头指向局部放大图
annotation('arrow',[0.78 0.74],[0.755 0.8],'Color','black','LineWidth',0.5);

subplot(3,1,2);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.40 0.7 0.25]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-400 200]);
yticks(-400:200:200);
xlabel({'(b) Time (Sec.)'});
ax = gca;
ax.YAxis.Exponent = 0;

plot(t,u(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_u,'Color',color6,'LineStyle','-','LineWidth',1.5);

legend({'$u$: Case 1', ...
        '$u$: Case 2', ...
        '$u$: Case 3', ...
        '$u$: Case 4', ...
        '$u$: Case 5'}, ...
        'FontSize', 16, ...
        'NumColumns',3,...
        'Interpreter','latex');

% 在原图中绘制局部放大图
axes('position',[0.28 0.46 0.4 0.08],'FontSize',16); % 设置放大图的位置和尺寸
box on;
hold on;
plot(t,u(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_u,'Color',color6,'LineStyle','-','LineWidth',1.5);

xlim([0, 0.009]); % 设置x轴的范围
%ylim([0, 70]); % 设置y轴的范围
xticks(0:0.003:0.009);
yticks(-400:200:-200);
ax = gca;
ax.YAxis.Exponent = 0;
ax.XAxis.Exponent = 0;
% 添加箭头指向局部放大图
annotation('arrow',[0.15 0.22],[0.45 0.46],'Color','black','LineWidth',0.5);

subplot(3,1,3);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.07 0.7 0.25]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-10 2500]);
yticks(0:800:2400);
xlabel({'(c) Time (Sec.)'});
ax = gca;
ax.YAxis.Exponent = 3;

plot(t,V(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_V,'Color',color6,'LineStyle','-','LineWidth',1.5);



legend({'IAC: Case 1', ...
        'IAC: Case 2', ...
        'IAC: Case 3', ...
        'IAC: Case 4', ...
        'IAC: Case 5'}, ...
        'FontSize', 16, ...
        'NumColumns',3,...
        'Interpreter','latex');

% 在原图中绘制局部放大图
axes('position',[0.36 0.110 0.35 0.065],'FontSize',16); % 设置放大图的位置和尺寸
box on;
hold on;
plot(t,V(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_V,'Color',color6,'LineStyle','-','LineWidth',1.5);


xlim([8, 10]); % 设置x轴的范围
ylim([1200, 1350]); % 设置y轴的范围
% xticks(1.4:0.1:1.6);
yticks(1200:100:1400);
% 添加箭头指向局部放大图
annotation('arrow',[0.8 0.73],[0.19 0.15],'Color','black','LineWidth',0.5);

print(gcf, '../../picture/Fig_5_4_1.eps', '-depsc', '-cmyk');

% figure(1);
% 
% set(gcf,'position',[150 50 900 600])
% 
% subplot(2,1,1);
% 
% set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
%         'position', [0.15 0.61 0.7 0.37]);
% hold on
% box on
% xlim ([0 10]);
% xticks(0:2:10);
% ylim ([-0.2 1.5]);
% yticks(0:0.5:1.5);
% xlabel({'Time (Sec.)'});
% 
% plot(t,x_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
% plot(t,x_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
% plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
% plot(t,x_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
% plot(t,NN_x_1,'Color',color6,'LineStyle','-','LineWidth',1.5);
% plot(t,y_d,'Color',color1,'LineStyle','--','LineWidth',3);
% 
% legend({'$x_1$, Case 1' ...
%         '$x_1$, Case 2', ...
%         '$x_1$, Case 3', ...
%         '$x_1$, Case 4', ...
%         '$x_1$, Case 5', ...
%         '$y_d$'}, ...
%         'FontSize', 16, ...
%         'NumColumns',2,...
%         'Interpreter','latex');
% % 在原图中绘制局部放大图
% axes('position',[0.32 0.72 0.4 0.13],'FontSize',16); % 设置放大图的位置和尺寸
% box on;
% hold on;
% plot(t,x_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
% plot(t,x_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
% plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
% plot(t,x_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
% plot(t,NN_x_1,'Color',color6,'LineStyle','-','LineWidth',1.5);
% plot(t,y_d,'Color',color1,'LineStyle','--','LineWidth',3);
% 
% xlim([8, 10]); % 设置x轴的范围
% ylim([-0.005, 0.02]); % 设置y轴的范围
% % xticks(1.4:0.1:1.6);
% yticks(0:0.01:0.02);
% ax = gca;
% ax.YAxis.Exponent = -2;
% % 添加箭头指向局部放大图
% annotation('arrow',[0.78 0.74],[0.655 0.7],'Color','black','LineWidth',0.5);
% 
% subplot(2,1,2);
% set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
%         'position', [0.15 0.11 0.7 0.37]);
% hold on
% box on
% 
% xlim ([0 10]);
% xticks(0:2:10);
% ylim ([-1.1 0.5]);
% yticks(-1:0.5:0.5);
% ax = gca;
% ax.YAxis.Exponent = 0;
% xlabel({'Time (Sec.)'});
% 
% plot(t,e_alpha_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
% plot(t,e_alpha_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
% plot(t,e_alpha_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
% plot(t,e_alpha_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
% plot(t,NN_e_alpha_1,'Color',color6,'LineStyle','-','LineWidth',1.5);
% 
% legend({'$\tilde{\alpha}_1$, Case 1' ...
%         '$\tilde{\alpha}_1$, Case 2', ...
%         '$\tilde{\alpha}_1$, Case 3', ...
%         '$\tilde{\alpha}_1$, Case 4', ...
%         '$\tilde{\alpha}_1$, Case 5'}, ...
%         'FontSize', 16, ...
%         'NumColumns',3,...
%         'Interpreter','latex');
% 
% % 在原图中绘制局部放大图
% axes('position',[0.26 0.18 0.4 0.13],'FontSize',16); % 设置放大图的位置和尺寸
% box on;
% hold on;
% plot(t,e_alpha_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
% plot(t,e_alpha_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
% plot(t,e_alpha_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
% plot(t,e_alpha_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
% plot(t,NN_e_alpha_1,'Color',color6,'LineStyle','-','LineWidth',1.5);
% 
% xlim([8, 10]); % 设置x轴的范围
% % ylim([-0.0002, 0.001]); % 设置y轴的范围
% % xticks(1.4:0.1:1.6);
% % yticks(-0.001:0.001:0.001);
% % ax = gca;
% % ax.YAxis.Exponent = 0;
% % 添加箭头指向局部放大图
% annotation('arrow',[0.18 0.22],[0.36 0.31],'Color','black','LineWidth',0.5);
% 
% 
% print(gcf, '../../picture/Fig_4_3.eps', '-depsc', '-cmyk');