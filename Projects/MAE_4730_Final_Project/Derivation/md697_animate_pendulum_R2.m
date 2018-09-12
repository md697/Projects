%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - Animate N Link Pendulum
% Does what the title says. Animates the N link pendulum (or 4 bar linkage
% if you are so inclined)
function md697_animate_pendulum_R2(t,p,rG,rP,titleText)
if p.n == 3
    figure()
    hold on
    axis equal
    plot(rP{1}(2,:),-rP{1}(1,:),'k','LineWidth',1)
    plot(rP{2}(2,:),-rP{2}(1,:),'r','LineWidth',1)
    plot(rP{3}(2,:),-rP{3}(1,:),'g','LineWidth',1)
    title('Motion of End Points of 3 Links')
    leg = legend('Link 1','Link 2','Link 3');
    set(leg,'Interpreter','latex')
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    xlabel('x (m)')
    ylabel('y (m)')
    grid on
    box on
else
    figure()
    hold on
    axis equal
    for i = 1:p.n
        plot(rP{i}(2,:),-rP{i}(1,:),'k','LineWidth',1)
    end
    title(['Motion of End Points of ',num2str(p.n),' Links'])
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    xlabel('x (m)')
    ylabel('y (m)')
    grid on
    box on
end

figure()
hold on
axis equal
axis([-sum(p.L),sum(p.L),-sum(p.L),sum(p.L)])
xlabel('X(m)')
ylabel('Y(m)')
title(titleText)
set(findall(gcf,'-property','FontSize'),'FontSize',14)

%% Animate
link = cell(1,p.n);

for i = 1:p.n
    link{i} = plot(0,0,'LineWidth',2);
end

% for i = 1:p.n
%     set(link{i}, 'Xdata',[0 rP{i}(2,1)],...
%         'Ydata',[0 -rP{i}(1,1)] )
% end
for k = 1:1
    set(link{1}, 'Xdata',[0 rP{1}(2,k)],...
        'Ydata',[0 -rP{1}(1,k)] )
    for i = 2:p.n
        set(link{i}, 'Xdata', [rP{i-1}(2,k), rP{i}(2,k)],...
            'Ydata', [-rP{i-1}(1,k), -rP{i}(1,k)])
    end

    drawnow
%     pause(5e-3)

end
pause(2.5)
tic
tnow = toc;
% Linearly interpolating to animate in real time
while tnow<=t(end) % While time is less than or equal to end time
    
    set(link{1}, 'Xdata',[0 interp1(t,rP{1}(2,:),tnow)],...
        'Ydata',[0 interp1(t,-rP{1}(1,:),tnow)] )
    for i = 2:p.n
        set(link{i}, 'Xdata', [interp1(t,rP{i-1}(2,:),tnow),interp1(t,rP{i}(2,:),tnow)],...
            'Ydata', [interp1(t,-rP{i-1}(1,:),tnow), interp1(t,-rP{i}(1,:),tnow)])
    end
    
    drawnow
    tnow = toc;
    %     pause(5e-3)
end

if p.n == 3
    hold on
    axis equal
    plot(rP{1}(2,:),-rP{1}(1,:),'k','LineWidth',1)
    plot(rP{2}(2,:),-rP{2}(1,:),'r','LineWidth',1)
    plot(rP{3}(2,:),-rP{3}(1,:),'g','LineWidth',1)
    title('Motion of End Points of 3 Links')
    leg = legend('Link 1','Link 2','Link 3');
    set(leg,'Interpreter','latex')
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    xlabel('x (m)')
    ylabel('y (m)')
    grid on
    box on
else
    hold on
    axis equal
    for i = 1:p.n
        plot(rP{i}(2,:),-rP{i}(1,:),'k','LineWidth',1)
    end
    title(['Motion of End Points of ',num2str(p.n),' Links'])
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    xlabel('x (m)')
    ylabel('y (m)')
    grid on
    box on
end
%% OLD ANIMATION
% for k = 1:length(t)
%     set(link{1}, 'Xdata',[0 rP{1}(2,k)],...
%         'Ydata',[0 -rP{1}(1,k)] )
%     for i = 2:p.n
%         set(link{i}, 'Xdata', [rP{i-1}(2,k), rP{i}(2,k)],...
%             'Ydata', [-rP{i-1}(1,k), -rP{i}(1,k)])
%     end
%
%     drawnow
% %     pause(5e-3)
%
% end
hold off















end