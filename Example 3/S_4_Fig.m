run("S3_simulation_verify.m")

color1 = [52,205,50]/255;
color2 = 'r';
color3 = 'b';
color4 = 'k';

% [0.00, 0.45, 0.74];% 浅蓝
% [0.93,0.69,0.13];% 浅黄
% [053,183,119]/255;% 浅绿
% [62, 43, 109]/255;% 浅紫

figure(1);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on
xlim ([0 10]);
xticks(0:2:10);
ylim ([-4 6]);
yticks(-3:3:6);
xlabel({'(a) Time (Sec.)'});


p_1 = plot(t,hat_f_1(:,1),'Color','b','LineStyle','-','LineWidth',2);
p_2 = plot(t,f_1(:,1),'Color','k','LineStyle','--','LineWidth',3);


legend([p_2,p_1],{'$f_1(\bar{x}_1)$','$\hat{\theta}_1\phi_1(\bar{x}_1)$'}, 'Orientation', 'horizontal', 'FontSize', 16, 'Interpreter','latex');

subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-3 4]);
yticks(-2:2:4);
xlabel({'(b) Time (Sec.)'});


p_1 = plot(t,hat_f_2(:,1),'Color','b','LineStyle','-','LineWidth',2);
p_2 = plot(t,f_2(:,1),'Color','k','LineStyle','--','LineWidth',3);

legend([p_2,p_1],{'$f_2(\bar{x}_2)$','$\hat{\theta}_2\phi_2(\bar{x}_2)$'}, 'Orientation', 'horizontal', 'FontSize', 16, 'Interpreter','latex');

print(gcf, '../../picture/Fig_5_3_1.eps', '-depsc', '-cmyk');

figure(2);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on
xlim ([0 10]);
xticks(0:2:10);
ylim ([-6 18]);
yticks(-6:6:18);
xlabel({'(a) Time (Sec.)'});

p_1 = plot(t,x_1(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
p_3 = plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
p_2 = plot(t,x_1(:,2),'Color',color2,'LineStyle','--','LineWidth',2);
p_4 = plot(t,y_d,'Color',color4,'LineStyle','--','LineWidth',3);


legend([p_1,p_3,p_2,p_4], ...
      {'$x_1$, Case 1' ...
       '$x_1$, Case 3', ...
       '$x_1$, Case 2', ...
       '$y_d$'}, ...
       'FontSize', 16, ...
       'NumColumns',2,...
       'Interpreter','latex');

% 在原图中绘制局部放大图
axes('position',[0.24 0.83 0.2 0.13],'FontSize',14); % 设置放大图的位置和尺寸
box on;
hold on;

p_1 = plot(t,x_1(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
p_3 = plot(t,x_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
p_2 = plot(t,x_1(:,2),'Color',color2,'LineStyle','--','LineWidth',2);
p_4 = plot(t,y_d,'Color',color4,'LineStyle','--','LineWidth',3);
xlim([0, 0.4]); % 设置x轴的范围
ylim([0, 3]); % 设置y轴的范围
% xticks(4.8:0.1:5);
yticks(0:1.5:3);
% 添加箭头指向局部放大图
annotation('arrow',[0.18 0.22],[0.73 0.80],'Color','black','LineWidth',0.5);

subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-0.02 2]);
yticks(0:0.5:2);
xlabel({'(b) Time (Sec.)'});

p_1 = plot(t,e_1(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
p_3 = plot(t,e_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
p_2 = plot(t,e_1(:,2),'Color',color2,'LineStyle','--','LineWidth',2);


legend([p_1,p_3,p_2], ...
      {'$e_1$, Case 1' ...
       '$e_1$, Case 3', ...
       '$e_1$, Case 2'}, ...
       'FontSize', 16, ...
       'NumColumns',1,...
       'Interpreter','latex');

% 在原图中绘制局部放大图
axes('position',[0.31 0.19 0.45 0.13],'FontSize',16); % 设置放大图的位置和尺寸
box on;
hold on;

p_1 = plot(t,e_1(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
p_3 = plot(t,e_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
p_2 = plot(t,e_1(:,2),'Color',color2,'LineStyle','--','LineWidth',2);



xlim([0, 10]); % 设置x轴的范围
ylim([-0.02, 0.02]); % 设置y轴的范围
ax = gca;
ax.YAxis.Exponent = -2;
% xticks(1.4:0.1:1.6);
% yticks(-3:2:1);
% 添加箭头指向局部放大图
annotation('arrow',[0.21 0.27],[0.12 0.20],'Color','black','LineWidth',0.5);


print(gcf, '../../picture/Fig_5_3_2.eps', '-depsc', '-cmyk');

figure(3);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on
xlim ([0 10]);
xticks(0:2:10);
ylim ([-0.2 15]);
yticks(0:5:15);
xlabel({'(a) Time (Sec.)'});

p_1 = plot(t,e_2(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
p_3 = plot(t,e_2(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
p_2 = plot(t,e_2(:,2),'Color',color2,'LineStyle','--','LineWidth',2);

legend([p_1,p_2,p_3], ...
      {'$e_2$, Case 1' ...
       '$e_2$, Case 2', ...
       '$e_2$, Case 3'}, ...
       'FontSize', 16, ...
       'NumColumns',1,...
       'Interpreter','latex');

% 在原图中绘制局部放大图
axes('position',[0.31 0.69 0.45 0.13],'FontSize',16); % 设置放大图的位置和尺寸
box on;
hold on;
plot(t,e_2(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
plot(t,e_2(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
plot(t,e_2(:,2),'Color',color2,'LineStyle','--','LineWidth',2);

xlim([0, 10]); % 设置x轴的范围
ylim([-0.2, 0.2]); % 设置y轴的范围
% ax = gca;
% ax.YAxis.Exponent = -2;
% xticks(1.4:0.1:1.6);
% yticks(-3:2:1);
% 添加箭头指向局部放大图
annotation('arrow',[0.24 0.29],[0.61 0.66],'Color','black','LineWidth',0.5);


subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
% ylim ([-2 4]);
% yticks(-2:2:4);
xlabel({'(b) Time (Sec.)'});


p_1 = plot(t,e_alpha_1(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
p_3 = plot(t,e_alpha_1(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
p_2 = plot(t,e_alpha_1(:,2),'Color',color2,'LineStyle','--','LineWidth',2);


legend([p_1,p_2,p_3], ...
      {'$\tilde{\alpha}_1$, Case 1' ...
       '$\tilde{\alpha}_1$, Case 2', ...
       '$\tilde{\alpha}_1$, Case 3'}, ...
       'FontSize', 16, ...
       'Location', 'southeast',...
       'NumColumns',1,...
       'Interpreter','latex');

print(gcf, '../../picture/Fig_5_3_3.eps', '-depsc', '-cmyk');

figure(4);

set(gcf,'position',[150 50 900 600])

subplot(2,1,1);

set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.61 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([-200 100]);
yticks(-200:100:100);
xlabel({'(a) Time (Sec.)'});

p_1 = plot(t,u(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
p_3 = plot(t,u(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
p_2 = plot(t,u(:,2),'Color',color2,'LineStyle','--','LineWidth',2);

legend([p_1,p_2,p_3], ...
      {'$u$, Case 1', ...
       '$u$, Case 2', ...
       '$u$, Case 3'}, ...
       'FontSize', 16, ...
       'Location', 'southeast',...
       'NumColumns',1,...
       'Interpreter','latex');

% 在原图中绘制局部放大图
axes('position',[0.3 0.68 0.3 0.13],'FontSize',16); % 设置放大图的位置和尺寸
box on;
hold on;
plot(t,u(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
plot(t,u(:,2),'Color',color2,'LineStyle','--','LineWidth',2);
plot(t,u(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);

xlim([0, 0.1]); % 设置x轴的范围
ylim([-200, 100]); % 设置y轴的范围
% xticks(1.4:0.1:1.6);
yticks(-100:200:100);
% 添加箭头指向局部放大图
annotation('arrow',[0.15 0.24],[0.82 0.76],'Color','black','LineWidth',0.5);


subplot(2,1,2);
set(gca,'LineWidth',1,'FontSize',18,'FontName','Times New Roman',...
        'position', [0.15 0.11 0.7 0.37]);
hold on
box on

xlim ([0 10]);
xticks(0:2:10);
ylim ([0 12]);
yticks(0:4:12);
xlabel({'(b) Time (Sec.)'});

p_1 = plot(t,V_bound(:,1),'Color',color1,'LineStyle','--','LineWidth',1);
p_2 = plot(t,V_bound(:,2),'Color',color2,'LineStyle','--','LineWidth',1);
p_3 = plot(t,V_bound(:,3),'Color',color3,'LineStyle','--','LineWidth',1);
p_4 = plot(t,V(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
p_6 = plot(t,V(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
p_5 = plot(t,V(:,2),'Color',color2,'LineStyle','--','LineWidth',2);

legend([p_4,p_5,p_6,p_1,p_2,p_3], ...
      {'$||\gamma||$, Case 1', ...
       '$||\gamma||$, Case 2', ...
       '$||\gamma||$, Case 3' ...
       '$1/\sqrt{\lambda_{S}^{\min}}$, Case 1', ...
       '$1/\sqrt{\lambda_{S}^{\min}}$, Case 2', ...
       '$1/\sqrt{\lambda_{S}^{\min}}$, Case 3',}, ...
       'NumColumns',2,...
       'FontSize', 16, ...
       'Interpreter','latex');
% 在原图中绘制局部放大图
axes('position',[0.3 0.19 0.45 0.11],'FontSize',16); % 设置放大图的位置和尺寸
box on;
hold on;
plot(t,V_bound(:,1),'Color',color1,'LineStyle','--','LineWidth',1);
plot(t,V_bound(:,2),'Color',color2,'LineStyle','--','LineWidth',1);
plot(t,V_bound(:,3),'Color',color3,'LineStyle','--','LineWidth',1);
plot(t,V(:,1),'Color',color1,'LineStyle','-.','LineWidth',2);
plot(t,V(:,3),'Color',color3,'LineStyle','-.','LineWidth',2);
plot(t,V(:,2),'Color',color2,'LineStyle','--','LineWidth',2);

xlim([0, 10]); % 设置x轴的范围
ylim([0, 1.1]); % 设置y轴的范围
% xticks(1.4:0.1:1.6);
yticks(0:0.5:1);
% 添加箭头指向局部放大图
annotation('arrow',[0.21 0.27],[0.12 0.20],'Color','black','LineWidth',0.5);

print(gcf, '../../picture/Fig_5_3_4.eps', '-depsc', '-cmyk');