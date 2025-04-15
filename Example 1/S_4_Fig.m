run("S3_simulation_verify.m")

color1 = 'r';
color2 = 'b';% 蓝
color3 = [0.00, 0.45, 0.74];% 浅蓝
color4 = [0.93,0.69,0.13];% 浅黄
color5 = [053,183,119]/255;% 绿色
color6 = [62, 43, 109]/255;% 浅紫


figure(1);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on
xlim ([0 10]);
xticks(0:2:10);
ylim ([-3 3]);
yticks(-3:1.5:3);
xlabel({'(a) Time (Sec.)'});

plot(t,f_1(:,1),'Color',color1,'LineStyle','--','LineWidth',3);
plot(t,hat_f_1(:,1),'Color',color3,'LineStyle','-','LineWidth',1.5);

legend({'$f_1(\bar{x}_1)$','$\hat{\theta}_1\phi_1(\bar{x}_1)$'}, 'Orientation', 'horizontal', 'FontSize', 16, 'Interpreter','latex');

subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-3 9]);
yticks(-3:3:9);
xlabel({'(b) Time (Sec.)'});

plot(t,f_2(:,1),'Color',color1,'LineStyle','--','LineWidth',3);
plot(t,hat_f_2(:,1),'Color',color3,'LineStyle','-','LineWidth',1.5);

legend({'$f_2(\bar{x}_2)$','$\hat{\theta}_2\phi_2(\bar{x}_2)$'}, 'Orientation', 'horizontal', 'FontSize', 16, 'Interpreter','latex');

print(gcf, '../../picture/Fig_5_1_1.eps', '-depsc', '-cmyk');

figure(2);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on
xlim ([0 10]);
xticks(0:2:10);
ylim ([-1.5 2.5]);
yticks(-1:1:2.5);
xlabel({'(a) Time (Sec.)'});

plot(t,y_d,'Color',color1,'LineStyle','--','LineWidth',3);
plot(t,x_1(:,2),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,1),'Color',color6,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);



legend({'$y_d$','$x_1$, Case 2','$x_1$, Case 1','$x_1$, Case 3'},...
       'NumColumns',2, 'FontSize', 16,...
        'Interpreter','latex');

subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-0.4 0.6]);
yticks(-0.3:0.3:0.6);
xlabel({'(b) Time (Sec.)'});

plot(t,e_1(:,1),'Color',color6,'LineStyle','-.','LineWidth',1.5);
plot(t,e_1(:,2),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,e_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);

% plot(t,e_2(:,1),'Color',color1,'LineStyle','-','LineWidth',1.5);
% plot(t,e_2(:,2),'Color',color2,'LineStyle','-','LineWidth',1.5);
% plot(t,e_2(:,3),'Color',color5,'LineStyle','-','LineWidth',1.5);



legend({'$e_1$, Case 1','$e_1$, Case 2','$e_1$, Case 3'},...
        'NumColumns',1, 'FontSize', 16, 'Interpreter','latex');

print(gcf, '../../picture/Fig_5_1_2.eps', '-depsc', '-cmyk');

figure(3);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-10 10]);
% yticks(-0.5:1:3.5);
xlabel({'(a) Time (Sec.)'});

plot(t,u(:,1),'Color',color6,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,2),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);

legend({'$u$, Case 1','$u$, Case 2','$u$, Case 3'},...
        'NumColumns',1,'FontSize', 16,...
        'Interpreter','latex');

subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
%ylim ([-0.9 0.6]);
%yticks(-0.9:0.3:0.6);
xlabel({'(b) Time (Sec.)'});

plot(t,V_up(:,1),'Color',color6,'LineStyle','--','LineWidth',1.5);
plot(t,V_up(:,2),'Color',color5,'LineStyle','--','LineWidth',1.5);
plot(t,V_up(:,3),'Color',color3,'LineStyle','--','LineWidth',1.5);
plot(t,V(:,1),'Color',color6,'LineStyle','-','LineWidth',1.5);
plot(t,V(:,2),'Color',color5,'LineStyle','-','LineWidth',1.5);
plot(t,V(:,3),'Color',color3,'LineStyle','-','LineWidth',1.5);

legend({'$V_n(0)e^{-\tau t}$, Case 1','$V_n(0)e^{-\tau t}$, Case 2',...
        '$V_n(0)e^{-\tau t}$, Case 3','$V$, Case 1','$V$, Case 2',...
        '$V$, Case 3'}, 'NumColumns',2, 'FontSize', 16, 'Interpreter','latex');
% 在原图中绘制局部放大图
axes('position',[0.35 0.17 0.4 0.12],'FontSize',16); % 设置放大图的位置和尺寸
box on;
hold on;
plot(t,V_up(:,1),'Color',color6,'LineStyle','--','LineWidth',1.5);
plot(t,V_up(:,2),'Color',color5,'LineStyle','--','LineWidth',1.5);
plot(t,V_up(:,3),'Color',color3,'LineStyle','--','LineWidth',1.5);
plot(t,V(:,1),'Color',color6,'LineStyle','-','LineWidth',1.5);
plot(t,V(:,2),'Color',color5,'LineStyle','-','LineWidth',1.5);
plot(t,V(:,3),'Color',color3,'LineStyle','-','LineWidth',1.5);

xlim([1.5, 2]); % 设置x轴的范围
ylim([0, 0.008]); % 设置y轴的范围
% xticks(1.4:0.1:1.6);
% yticks(-3:2:1);
% 添加箭头指向局部放大图
annotation('arrow',[0.25 0.31],[0.11 0.19],'Color','black','LineWidth',0.5);

print(gcf, '../../picture/Fig_5_1_3.eps', '-depsc', '-cmyk');