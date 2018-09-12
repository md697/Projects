%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - Run Triple Pendulum
% Run triple pendulum using functions derived from
% md697_triple_pendulum_deriver

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Run using md697_DEMO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function md697_run_n_pend(p,t,z0,rederive,plots,animate)
%% Derive EOM
% rederive = input('Re-derive EOM? Enter 0 for no and 1 for yes\n');
if rederive ~= 0
    md697_n_pend_deriver(p.n)
end
% clear; % Re-use variables from kinematics so need to clear symbolic vars
%% Set parameters
% p.L = [1 1 1]; % lengths
% p.m = [1 1 1]; % masses
% p.g = 1; % acceleration due to gravity
% p.n = 3; % number of links
% p.I_G = (p.m .*p.L.^2)/12;
% 
% % tspan = [0 100];
% t = 20;
numpts = 60*t; % 60 points per second
tspan = linspace(0,t,numpts);

%% Set initial conditions
% init_ths = [pi/2; pi/2; pi/2];
% % init_ths = [pi;pi;pi];
% init_thDots = [0;0;0];
% 
% z0 = [init_ths;init_thDots];


%% Integrate
% % AMB
% options_AMB = odeset('AbsTol',1e-10,'RelTol',1e-10);
% [t_AMB,z_AMB] = ode45(@RHS_AMB,tspan,z0,options_AMB,p);
% ths_AMB = z_AMB(:,1:3);
% thdots_AMB = z_AMB(:,4:6);

% % DAE
% options_DAE = odeset('AbsTol',1e-10,'RelTol',1e-10);
% [t_DAE,z_DAE] = ode45(@RHS_DAE,tspan,z0,options_DAE,p);
% ths_DAE = z_DAE(:,1:p.n);
% thdots_DAE = z_DAE(:,p.n+1:2*p.n);

% LAG
options_LAG = odeset('AbsTol',1e-10,'RelTol',1e-10);
[t_LAG,z_LAG] = ode45(@RHS_LAG,tspan,z0,options_LAG,p);
ths_LAG = z_LAG(:,1:p.n);
thdots_LAG = z_LAG(:,p.n+1:2*p.n);

%% Check conservation of energy
% Find positions, velocities of points of interest
[rP,rG,vP,vG,~,~] = md697_n_pend_num_kinematics(p.n,ths_LAG,thdots_LAG,1,p);

% Energy conservation
Ek = 0; % initialize kinetic energy
Ep = 0; % initialize potential energy
for i = 1:p.n
    Ek = Ek + 0.5*p.m(i)*dot(vG{i},vG{i}) + 0.5*p.I_G(i)*(thdots_LAG(:,i).').^2;
    Ep = Ep - p.m(i)*p.g*rG{i}(1,:);
end
E_tot = Ek+Ep; % SHOULD BE CONSTANT


%% Plot Results
while plots == 1
%     figure(1)
%     hold on
%     plot(t_AMB,ths_AMB(:,1),'k','LineWidth',2)
%     plot(t_AMB,ths_AMB(:,2),'r','LineWidth',2)
%     plot(t_AMB,ths_AMB(:,3),'g','LineWidth',2)
%     title('\theta vs. time (AMB)')
%     xlabel('time (s)')
%     ylabel('\theta (rad)')
%     leg = legend('\theta_1','\theta_2','\theta_3')
%     grid on
%     box on
    
%     figure(2)
%     hold on
%     plot(t_DAE,ths_DAE(:,1),'k','LineWidth',2)
%     plot(t_DAE,ths_DAE(:,2),'r','LineWidth',2)
%     plot(t_DAE,ths_DAE(:,3),'g','LineWidth',2)
%     title('\theta vs. time (DAE)')
%     xlabel('time (s)')
%     ylabel('\theta (rad)')
%     leg = legend('\theta_1','\theta_2','\theta_3')
%     grid on
%     box on
    
    figure(3)
    hold on
%     legendnames = cell(1,p.n);
    for i = 1:p.n
        plot(t_LAG,ths_LAG(:,i),'LineWidth',2)
%         legendnames{i} = ['$$\theta_',num2str(i),'$$'];
    end
%     plot(t_LAG,ths_LAG(:,2),'r','LineWidth',2)
%     plot(t_LAG,ths_LAG(:,3),'g','LineWidth',2)
    title('$$\theta$$ vs. time (Lagrange)')
    xlabel('time (s)')
    ylabel('$$\theta$$ (rad)')
%     leg = legend('\theta_1','\theta_2','\theta_3')
%     leg = legend(legendnames);
%     set(leg,'Interpreter','latex')
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    grid on
    box on
    
    figure(4)
    hold on
    plot(t_LAG,E_tot,'k.','LineWidth',2)
    title('Total Energy vs. Time (LAG)')
    xlabel('time (s)')
    ylabel('$$E_{tot}$$ (J)')
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    grid on
    box on
    % close all
    
%     figure(5)
%     hold on
%     plot(t_AMB,ths_AMB(:,1)-ths_DAE(:,1),'k','LineWidth',2)
%     plot(t_AMB,ths_AMB(:,1)-ths_LAG(:,1),'r','LineWidth',2)
%     plot(t_DAE,ths_DAE(:,1)-ths_LAG(:,1),'g','LineWidth',2)
%     title('Comparison of \theta_1 Output vs. Time')
%     xlabel('time (s)')
%     ylabel('\Delta\theta_1 (rad)')
%     leg = legend('AMB-DAE','AMB-LAG','DAE-LAG')
%     grid on
%     box on
    
%     figure(6)
%     hold on
%     plot(t_AMB,ths_AMB(:,1),'k','LineWidth',1)
%     plot(t_DAE,ths_DAE(:,1),'r','LineWidth',1)
%     plot(t_LAG,ths_LAG(:,1),'g--','LineWidth',1)
%     title('\theta_1 for AMB, DAE, and Lagrange')
%     xlabel('time (s)')
%     ylabel('\theta_1 (rad)')
%     leg = legend('AMB','DAE','LAG')
%     grid on
%     box on
    
%     figure(7)
%     hold on
%     plot(t_AMB,ths_AMB(:,2),'k','LineWidth',1)
%     plot(t_DAE,ths_DAE(:,2),'r','LineWidth',1)
%     plot(t_LAG,ths_LAG(:,2),'g--','LineWidth',1)
%     title('\theta_2 for AMB, DAE, and Lagrange')
%     xlabel('time (s)')
%     ylabel('\theta_2 (rad)')
%     leg = legend('AMB','DAE','LAG')
%     grid on
%     box on
    
%     figure(8)
%     hold on
%     plot(t_AMB,ths_AMB(:,3),'k','LineWidth',1)
%     plot(t_DAE,ths_DAE(:,3),'r','LineWidth',1)
%     plot(t_LAG,ths_LAG(:,3),'g--','LineWidth',1)
%     title('\theta_3 for AMB, DAE, and Lagrange')
%     xlabel('time (s)')
%     ylabel('\theta_3 (rad)')
%     leg = legend('AMB','DAE','LAG')
%     grid on
%     box on
    
%     figure(9)
%     hold on
%     axis equal
%     plot(rP{1}(2,:),-rP{1}(1,:),'k','LineWidth',1)
%     plot(rP{2}(2,:),-rP{2}(1,:),'r','LineWidth',1)
%     plot(rP{3}(2,:),-rP{3}(1,:),'g','LineWidth',1)
%     title('Motion of End Points of Links')
%     leg = legend('Link 1','Link 2','Link 3')
%     xlabel('x (m)')
%     ylabel('y (m)')
    
    plots = 0;
end

%% Save Results
% save([num2str(p.n),'_link_pendulum_data.mat']);

%% Animate Results
% Animate AMB pendulum
if animate == 1
    md697_animate_pendulum_R2(t_LAG,p,rG,rP,['Lagrange ',num2str(p.n),' Link Pendulum'])
end



%% RHS Functions
function zdot = RHS_AMB(~,z,p)
thetas = z(1:p.n).';
thetadots = z(p.n+1:end).';

A = Amat_AMB(p.L,p.m,p.g,thetas,thetadots);
b = bvec_AMB(p.L,p.m,p.g,thetas,thetadots);

thetaddots = A\b;

zdot = [thetadots.';thetaddots];
end

function zdot = RHS_DAE(~,z,p)
%     exes = z(1:p.n).';
%     wise = z(1*p.n+1:2*p.n).';
%     thetas = z(2*p.n+1:3*p.n);
%     xdots = z(3*p.n+1:4*p.n);
%     ydots = z(4*p.n+1:5*p.n);
%     thetadots = z(5*p.n+1:6*p.n);
%     Fexes = z(6*p.n+1:7*p.n);
%     Fwise = z(7*p.n+1:8*p.n);
thetas = z(1:p.n);
thetadots = z(p.n+1:end);
A = Amat_DAE(p.L,p.m,thetas.');
b = bvec_DAE(p.L,p.m,p.g,thetas.',thetadots.');

c = A\b; % [xDDot;yDDot;thDDot;Fexes;Fwise]
theta2dots = c(2*p.n+1:3*p.n);

%     zdot = [xdots;ydots;thetadots;c];
zdot = [thetadots;theta2dots];
end

function zdot = RHS_LAG(~,z,p)
thetas = z(1:p.n).';
thetadots = z(p.n+1:end).';

A_call = ['Amat_LAG_',num2str(p.n),'_link(p.L,p.m,thetas)'];
b_call = ['bvec_LAG_',num2str(p.n),'_link(p.L,p.m,p.g,thetas,thetadots)'];

A = eval(A_call);
b = eval(b_call);
% A = Amat_LAG(p.L,p.m,thetas);
% b = bvec_LAG(p.L,p.m,p.g,thetas,thetadots);

thetaddots = A\b;

zdot = [thetadots.';thetaddots];
end



end