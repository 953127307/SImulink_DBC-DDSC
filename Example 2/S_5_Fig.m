run("S4_ABC_simulation.m")

color1 = 'r';
color2 = 'm';% 粉
color3 = [0.00, 0.45, 0.74];% 浅蓝
color4 = [0.93,0.69,0.13];% 浅黄
color5 = [053,183,119]/255;% 浅色
color6 = [62, 43, 109]/255;% 浅紫
color7 = 'k';% 黑

figure(1);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on
xlim ([0 10]);
xticks(0:2:10);
ylim ([-1.5 4]);
yticks(-1.5:1.5:4);
xlabel({'Time (Sec.)'});

plot(t,x_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_x_1,'Color',color6,'LineStyle','-','LineWidth',1.5);
plot(t,y_d,'Color',color1,'LineStyle','--','LineWidth',3);
% plot(t,NN_x_1(:,2),'Color','g','LineStyle','-.','LineWidth',1.5);
% plot(t,NN_x_1(:,3),'Color','r','LineStyle','-.','LineWidth',1.5);

legend({'$x_1$, Case 1' ...
        '$x_1$, Case 2', ...
        '$x_1$, Case 3', ...
        '$x_1$, Case 4', ...
        '$x_1$, Case 5', ...
        '$y_d$'}, ...
        'FontSize', 16, ...
        'NumColumns',2,...
        'Interpreter','latex');

% 在原图中绘制局部放大图
axes('position',[0.22 0.83 0.2 0.13],'FontSize',14); % 设置放大图的位置和尺寸
box on;
hold on;
plot(t,x_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,x_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_x_1,'Color',color6,'LineStyle','-','LineWidth',1.5);
plot(t,y_d,'Color',color1,'LineStyle','--','LineWidth',3);
xlim([4.8, 5]); % 设置x轴的范围
ylim([-1.1, -0.93]); % 设置y轴的范围
xticks(4.8:0.1:5);
yticks(-1.1:0.1:-0.9);
% 添加箭头指向局部放大图
annotation('arrow',[0.48 0.44],[0.64 0.78],'Color','black','LineWidth',0.5);

subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-0.2 0.4]);
yticks(-0.2:0.2:0.4);
xlabel({'Time (Sec.)'});

plot(t,e_1(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,e_1(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,e_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,e_1(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_e_1,'Color',color6,'LineStyle','-','LineWidth',1.5);

legend({'$e_1$, Case 1' ...
        '$e_1$, Case 2', ...
        '$e_1$, Case 3', ...
        '$e_1$, Case 4', ...
        '$e_1$, Case 5'}, ...
        'FontSize', 16, ...
        'NumColumns',3,...
        'Interpreter','latex');

print(gcf, '../../picture/Fig_5_2_1.eps', '-depsc', '-cmyk');

figure(2);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-80 80]);
yticks(-80:40:80);
xlabel({'Time (Sec.)'});

plot(t,u(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,u(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_u,'Color',color6,'LineStyle','-','LineWidth',1.5);

legend({'$u$, Case 1', ...
        '$u$, Case 2', ...
        '$u$, Case 3', ...
        '$u$, Case 4', ...
        '$u$, Case 5'}, ...
        'FontSize', 16, ...
        'NumColumns',3,...
        'Interpreter','latex');

subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([0 4000]);
yticks(0:1000:4000);
xlabel({'Time (Sec.)'});

plot(t,V(:,1),'Color',color5,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,2),'Color',color4,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,3),'Color',color3,'LineStyle','-.','LineWidth',1.5);
plot(t,V(:,4),'Color',color2,'LineStyle','-.','LineWidth',1.5);
plot(t,NN_V,'Color',color6,'LineStyle','-','LineWidth',1.5);


legend({'IAC, Case 1', ...
        'IAC, Case 2', ...
        'IAC, Case 3', ...
        'IAC, Case 4', ...
        'IAC, Case 5'}, ...
        'FontSize', 16, ...
        'NumColumns',3,...
        'Interpreter','latex');
% % 在原图中绘制局部放大图
% axes('position',[0.3 0.25 0.4 0.13],'FontSize',16); % 设置放大图的位置和尺寸
% box on;
% hold on;
% plot(t,V(:,1),'Color','b','LineStyle','-','LineWidth',1.5);
% plot(t,V(:,2),'Color','g','LineStyle','-','LineWidth',1.5);
% plot(t,V(:,3),'Color','r','LineStyle','-','LineWidth',1.5);
% plot(t,V(:,4),'Color','r','LineStyle','-','LineWidth',1.5);
% plot(t,NN_V,'Color','b','LineStyle','-.','LineWidth',1.5);
% 
% xlim([0.6, 1.4]); % 设置x轴的范围
% ylim([0, 0.01]); % 设置y轴的范围
% % xticks(1.4:0.1:1.6);
% % yticks(-3:2:1);
% % 添加箭头指向局部放大图
% annotation('arrow',[0.21 0.27],[0.12 0.20],'Color','black','LineWidth',0.5);

print(gcf, '../../picture/Fig_5_2_2.eps', '-depsc', '-cmyk');