
figure(1);

set(gcf,'position',[150 50 900 600])

% 子图1：所有x_1和x_d
subplot(2,2,1);
hold on; box on;
xlim([0 10]);
xticks(0:2:10);
ylim([-1.5 2.5]);
yticks(-1:1:2.5);
xlabel('Time (Sec.)');
plot(t, y_d, 'Color','k','LineStyle','--','LineWidth',3);
plot(t, x_1(:,1), 'Color','b','LineStyle',':','LineWidth',1.5);
plot(t, x_1(:,2), 'Color','g','LineStyle',':','LineWidth',1.5);
plot(t, x_1(:,3), 'Color','r','LineStyle',':','LineWidth',1.5);
legend({'$y_d$','$x_1$, Case 1','$x_1$, Case 2','$x_1$, Case 3'},...
    'FontSize',10,'Interpreter','latex','NumColumns',2);

% 子图2：第一个x_1和NN_x_1
subplot(2,2,2);
hold on; box on;
xlim([0 10]);
xticks(0:2:10);
ylim([-1.5 2.5]);
yticks(-1:1:2.5);
xlabel('Time (Sec.)');
plot(t, y_d, 'Color','k','LineStyle','--','LineWidth',3);
plot(t, x_1(:,1), 'Color','r','LineStyle',':','LineWidth',1.5);
plot(t, NN_x_1(:,1), 'Color','b','LineStyle','-.','LineWidth',1.5);
legend({'$y_d$','$x_1$ (data)','$x_1$ (adaptive)'},...
    'FontSize',10,'Interpreter','latex');

% 子图3：第二个x_1和NN_x_1
subplot(2,2,3);
hold on; box on;
xlim([0 10]);
xticks(0:2:10);
ylim([-1.5 2.5]);
yticks(-1:1:2.5);
xlabel('Time (Sec.)');
plot(t, y_d, 'Color','k','LineStyle','--','LineWidth',3);
plot(t, x_1(:,2), 'Color','r','LineStyle',':','LineWidth',1.5);
plot(t, NN_x_1(:,2), 'Color','b','LineStyle','-.','LineWidth',1.5);
legend({'$y_d$','$x_1$ (data)','$x_1$ (adaptive)'},...
    'FontSize',10,'Interpreter','latex');

% 子图4：第三个x_1和NN_x_1
subplot(2,2,4);
hold on; box on;
xlim([0 10]);
xticks(0:2:10);
ylim([-1.5 2.5]);
yticks(-1:1:2.5);
xlabel('Time (Sec.)');
plot(t, y_d, 'Color','k','LineStyle','--','LineWidth',3);
plot(t, x_1(:,3), 'Color','r','LineStyle',':','LineWidth',1.5);
plot(t, NN_x_1(:,3), 'Color','b','LineStyle','-.','LineWidth',1.5);
legend({'$y_d$','$x_1$ (data)','$x_1$ (adaptive)'},...
    'FontSize',10,'Interpreter','latex');

% % 调整整体布局
% set(gcf,'Position',[100 100 1200 800]);
% ha = findobj(gcf,'type','axes');
% set(ha(1:2),'XTickLabel',[]); 
% set(ha,'FontSize',12,'TickLabelInterpreter','latex');
% for i = 3:4
%     xlabel(ha(i),'Time (Sec.)','FontSize',14,'Interpreter','latex');
% end