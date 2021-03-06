clear all
close all
clc

% run scripts for parameters
run('QuadrotorConstants.m')
run('InitialConditions.m')
run('TuningParameters.m')

% set default
set(0,'defaultTextInterpreter','latex');

% set time span
tSpan = 20;

t = linspace(0,tSpan,200).';
% 
% % % set desired state
% xdes      = 0;
% ydes      = 0;
% zdes      = 10;
% phides    = 0;
% thetades  = 0;
% psides    = 0;
% dxdes     = 0;
% dydes     = 0;
% dzdes     = 0;
% dphides   = 0;
% dthetades = 0;
% dpsides   = 0;
% XDes = [xdes,dxdes,ydes,dydes,zdes,dzdes,phides,dphides,thetades,dthetades,psides,dpsides].';

xdes      = ones(length(t),1).*0;
dxdes     = ones(length(t),1).*0;
ydes      = ones(length(t),1).*0;
dydes     = ones(length(t),1).*0;
zdes      = ones(length(t),1).*0;
dzdes     = ones(length(t),1).*0;
phides    = ones(length(t),1).*cos(t);
dphides   = ones(length(t),1).*0;
thetades  = ones(length(t),1).*-pi/6;
dthetades = ones(length(t),1).*0;
psides    = ones(length(t),1).*sin(t);
dpsides   = ones(length(t),1).*0;
XDes = [t,xdes,dxdes,ydes,dydes,zdes,dzdes,phides,dphides,thetades,dthetades,psides,dpsides];

tdes = linspace(0,tSpan,200);

% xmin = -10;
% xmax = 300;
% ymin = -10;
% ymax = 300;
% zmin = -1;
% zmax = 15;

disturbancex = 0;
disturbancey = 0;
disturbancez = 0;
disturbancePhi = 0;
disturbanceTheta = 0;
disturbancePsi = 0;

% run simulink simulation
sim('CL_Xpro_model.slx');

% store simulation info into variables
Time   = state.Time;
x      = state.Data(:,1);
dx     = state.Data(:,2);
y      = state.Data(:,3);
dy     = state.Data(:,4);
z      = state.Data(:,5);
dz     = state.Data(:,6);
phi    = state.Data(:,7);
dphi   = state.Data(:,8);
theta  = state.Data(:,9);
dtheta = state.Data(:,10);
psi    = state.Data(:,11);
dpsi   = state.Data(:,12);

% animateQuadrotor(state,XDes)


%% plot trajectory
figure(1)
hold on
title('Trajectory')
plot3(x,y,z,'r','LineWidth',1);
xlabel('x (m)');
ylabel('y (m)');
zlabel('z (m)');
grid on
hold off

%% plots linear positions
figure(2)
subplot(3,1,1)
plot(Time,x,'k','LineWidth',1)
title('$x$');
xlabel('t (s)');
ylabel('x (m)');
subplot(3,1,2)
plot(Time,y,'k','LineWidth',1)
title('$y$');
xlabel('t (s)');
ylabel('y (m)');
subplot(3,1,3)
hold on
plot(Time,z,'k','LineWidth',1)
plot(tdes,zdes,'r--','LineWidth',1)
title('$z$');
xlabel('t (s)');
ylabel('z (m)');

%% plots angular positions
figure(3)
subplot(3,1,1)
hold on
plot(Time,phi,'k','LineWidth',1)
plot(tdes,phides,'r--','LineWidth',1)
hold off
title('$\phi$');
xlabel('t (s)');
ylabel('$\phi$ (rad)');
subplot(3,1,2)
hold on
plot(Time,theta,'k','LineWidth',1)
plot(tdes,thetades,'r--','LineWidth',1)
hold off
title('$\theta$');
xlabel('t (s)');
ylabel('$\theta$ (rad)');
subplot(3,1,3)
hold on
plot(Time,psi,'k','LineWidth',1)
plot(tdes,psides,'r--','LineWidth',1)
hold off
title('$\psi$');
xlabel('t (s)');
ylabel('$\psi$ (rad)');

%% plots linear rates
figure(4)
subplot(3,1,1)
plot(Time,dx,'k','LineWidth',1)
title('$\dot{x}$');
xlabel('t (s)');
ylabel('$\dot{x}$ (m/s)');
subplot(3,1,2)
plot(Time,dy,'k','LineWidth',1)
title('$\dot{y}$');
xlabel('t (s)');
ylabel('$\dot{y}$ (m/s)');
subplot(3,1,3)
plot(Time,dz,'k','LineWidth',1)
title('$\dot{z}$');
xlabel('t (s)');
ylabel('$\dot{z}$ (m/s)');

%% plots angular rates
figure(5)
subplot(3,1,1)
plot(Time,dphi,'k','LineWidth',1)
title('$\dot{\phi}$')
xlabel('t (s)');
ylabel('$\dot{\phi}$ (rad/s)');
subplot(3,1,2)
plot(Time,dtheta,'k','LineWidth',1)
title('$\dot{\theta}$')
xlabel('t (s)');
ylabel('$\dot{\theta}$ (rad/s)');
subplot(3,1,3)
plot(Time,dpsi,'k','LineWidth',1)
title('$\dot{\psi}$')
xlabel('t (s)');
ylabel('$\dot{\psi}$ (rad/s)');

%% Animate
figure(99)
animateQuadrotor(state,XDes,'HelicalTrajectoryFollowing.gif',0)
% animateQuadrotorConstant(state,XDes,'UpsideDown.gif',1)

%% plot voltages
t  = Vout.Time;
v1 = Vout.Data(:,1);
v2 = Vout.Data(:,2);
v3 = Vout.Data(:,3);
v4 = Vout.Data(:,4);
figure(6)
plot(t,v4,t,v3,t,v2,t,v1)
title('Temporal variation of voltage')
xlabel('t (s)');
ylabel('$V_{out}$ (V)');
legend({'V_1','V_2','V_3','V_4'})

%% plot U's
t = U_s.Time;
us1 = U_s.Data(:,1);
us2 = U_s.Data(:,2);
us3 = U_s.Data(:,3);
us4 = U_s.Data(:,4);
figure(7)
plot(t,us1,t,us2,t,us3,t,us4)
title('Temporal variation of control inputs')
xlabel('t (s)');
yyaxis left
ylabel('U (N)');
yyaxis right
ylabel('U (N-m)');
legend({'U_1','U_2','U_3','U_4'})
%}

% % plot sliding surfaces
% t = sliding.Time;
% sliding1 = sliding.Data(:,1);
% sliding2 = sliding.Data(:,2);
% sliding3 = sliding.Data(:,3);
% sliding4 = sliding.Data(:,4);
% figure
% clf
% plot(t,sliding4,t,sliding3,t,sliding2,t,sliding1)
% legend({'sliding4','sliding3','sliding2','sliding1'})