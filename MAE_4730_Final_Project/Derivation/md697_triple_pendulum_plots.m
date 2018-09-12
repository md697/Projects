%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - Triple Pendulum Plots

figure(1)
hold on
plot(t_AMB,ths_AMB(:,1),'k','LineWidth',2)
plot(t_AMB,ths_AMB(:,2),'r','LineWidth',2)
plot(t_AMB,ths_AMB(:,3),'g','LineWidth',2)
title('\theta vs. time (AMB)')
xlabel('time (s)')
ylabel('\theta (rad)')
legend('\theta_1','\theta_2','\theta_3')
grid on
box on

figure(2)
hold on
plot(t_DAE,ths_DAE(:,1),'k','LineWidth',2)
plot(t_DAE,ths_DAE(:,2),'r','LineWidth',2)
plot(t_DAE,ths_DAE(:,3),'g','LineWidth',2)
title('\theta vs. time (DAE)')
xlabel('time (s)')
ylabel('\theta (rad)')
legend('\theta_1','\theta_2','\theta_3')
grid on
box on

figure(3)
hold on
plot(t_LAG,ths_LAG(:,1),'k','LineWidth',2)
plot(t_LAG,ths_LAG(:,2),'r','LineWidth',2)
plot(t_LAG,ths_LAG(:,3),'g','LineWidth',2)
title('\theta vs. time (Lagrange)')
xlabel('time (s)')
ylabel('\theta (rad)')
legend('\theta_1','\theta_2','\theta_3')
grid on
box on

figure(4)
hold on
plot(t_DAE,E_tot,'k.','LineWidth',2)
title('Total Energy vs. Time (LAG)')
xlabel('time (s)')
ylabel('E_{tot} (J)')
grid on
box on
% close all

figure(5)
hold on
plot(t_AMB,ths_AMB(:,1)-ths_DAE(:,1),'k','LineWidth',2)
plot(t_AMB,ths_AMB(:,1)-ths_LAG(:,1),'r','LineWidth',2)
plot(t_DAE,ths_DAE(:,1)-ths_LAG(:,1),'g','LineWidth',2)
title('Comparison of \theta_1 Output vs. Time')
xlabel('time (s)')
ylabel('\Delta\theta_1 (rad)')
legend('AMB-DAE','AMB-LAG','DAE-LAG')
grid on
box on

figure(6)
hold on
plot(t_AMB,ths_AMB(:,1),'k','LineWidth',1)
plot(t_DAE,ths_DAE(:,1),'r','LineWidth',1)
plot(t_LAG,ths_LAG(:,1),'g--','LineWidth',1)
title('\theta_1 for AMB, DAE, and Lagrange')
xlabel('time (s)')
ylabel('\theta_1 (rad)')
legend('AMB','DAE','LAG')
grid on 
box on

figure(7)
hold on
plot(t_AMB,ths_AMB(:,2),'k','LineWidth',1)
plot(t_DAE,ths_DAE(:,2),'r','LineWidth',1)
plot(t_LAG,ths_LAG(:,2),'g--','LineWidth',1)
title('\theta_2 for AMB, DAE, and Lagrange')
xlabel('time (s)')
ylabel('\theta_2 (rad)')
legend('AMB','DAE','LAG')
grid on 
box on

figure(8)
hold on
plot(t_AMB,ths_AMB(:,3),'k','LineWidth',1)
plot(t_DAE,ths_DAE(:,3),'r','LineWidth',1)
plot(t_LAG,ths_LAG(:,3),'g--','LineWidth',1)
title('\theta_3 for AMB, DAE, and Lagrange')
xlabel('time (s)')
ylabel('\theta_3 (rad)')
legend('AMB','DAE','LAG')
grid on 
box on

figure(9)
hold on
axis equal
plot(rP{1}(2,:),-rP{1}(1,:),'k','LineWidth',1)
plot(rP{2}(2,:),-rP{2}(1,:),'r','LineWidth',1)
plot(rP{3}(2,:),-rP{3}(1,:),'g','LineWidth',1)
title('Motion of End Points of Links')
legend('Link 1','Link 2','Link 3')
xlabel('x (m)')
ylabel('y (m)')




