%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - Run Four Bar Linkage
% Run four bar linkage using functions derived from
% md697_four_bar_deriver

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Run using md697_four_bar_DEMO %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function md697_run_four_bar_linkage(p,t,z0,rederive,plots,animate)
%% Derive EOM
% rederive = input('Re-derive EOM? Enter 0 for no and 1 for yes\n');
if rederive ~= 0
    md697_four_bar_deriver
end
% clear; % Re-use variables from kinematics so need to clear symbolic vars
% %% Set parameters
% p.L = [1 9 1]; % lengths
% p.m = [1 5 1]; % masses
% p.g = 5; % acceleration due to gravity
% p.n = 3; % number of links
% I_G = (p.m .*p.L.^2)/12;
%
% % tspan = [0 100];
% t = 100;
numpts = 60*t; % 60 points per second
tspan = linspace(0,t,numpts);

% %% Set initial conditions
% % init_ths = [88*pi/180 + pi/2 ; pi/2; 0];
% % init_ths = [pi;pi;pi];
% % init_ths = [pi/2;deg2rad(90+3);deg2rad(270+90)];
% init_ths = [deg2rad(90+70);pi/2;deg2rad(90-20)];
% % FILL IN ONE OF thD1,thD2,or thD3 and pass in [] for the other values
% % init_thDots = md697_four_bar_init_conds(p,init_ths,thD1, thD2, thD3)
%
% init_thD1 = [5];
% init_thD2 = [];
% init_thD3 = [];
%
% init_thDots = md697_four_bar_init_conds(p,init_ths,init_thD1, init_thD2, init_thD3);
%
% z0 = [init_ths;init_thDots];

%% Integrate
% DAE
options = odeset('AbsTol',1e-10,'RelTol',1e-10);
[t,z] = ode45(@RHS_DAE,tspan,z0,options,p);
ths = z(:,1:p.n);
thdots = z(:,p.n+1:2*p.n);

%% Check conservation of energy
% Find positions, velocities of points of interest
[rP,rG,vP,vG,~,~] = md697_n_pend_num_kinematics(p.n,ths,thdots,1,p);

% Energy conservation
Ek = 0; % initialize kinetic energy
Ep = 0; % initialize potential energy
for i = 1:p.n
    Ek = Ek + 0.5*p.m(i)*dot(vG{i},vG{i}) + 0.5*p.I_G(i)*(thdots(:,i).').^2;
    Ep = Ep - p.m(i)*p.g*rG{i}(1,:);
end
E_tot = Ek+Ep; % SHOULD BE CONSTANT

%% Plot Results
while plots ~= 0
    figure(1)
    hold on
    plot(t,ths(:,1),'k','LineWidth',2)
    plot(t,ths(:,2),'r','LineWidth',2)
    plot(t,ths(:,3),'g','LineWidth',2)
    title('$$\theta$$ vs. time (DAE)')
    xlabel('time (s)')
    ylabel('$$\theta$$ (rad)')
    leg = legend('$$\theta_1$$','$$\theta_2$$','$$\theta_3$$');
    set(leg,'Interpreter','latex')
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    grid on
    box on
    
    figure(2)
    hold on
    plot(t,E_tot,'k.','LineWidth',2)
    title('Total Energy vs. Time (DAE)')
    xlabel('time (s)')
    ylabel('$$E_{tot}$$ (J)')
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    grid on
    box on
    
    figure(3)
    hold on
    axis equal
    plot(rP{1}(2,:),-rP{1}(1,:),'k','LineWidth',1)
    plot(rP{2}(2,:),-rP{2}(1,:),'r','LineWidth',1)
    plot(rP{3}(2,:),-rP{3}(1,:),'g','LineWidth',1)
    leg = legend('Link 1','Link 2','Link 3');
    set(leg,'Interpreter','latex')
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    title('Motion of End Points of Links')
    xlabel('x (m)')
    ylabel('y (m)')
    
    figure(4)
    hold on
    plot(t,rP{3}(2,:)-rP{3}(2,1),'k--','LineWidth',1)
    plot(t,-rP{3}(1,:)+rP{3}(1,1),'r--','LineWidth',1)
    title('X and Y of Pinned Point vs. Time')
    xlabel('time (s)')
    ylabel('position (m)')
    leg = legend('X','Y');
    set(leg,'Interpreter','latex')
    set(findall(gcf,'-property','FontSize'),'FontSize',14)
    plots = 0;
end


%% Animate Results
if animate ~=0
    md697_animate_pendulum_R2(t,p,rG,rP,'Four Bar Linkage Animation')
end



%% RHS Files
    function zdot = RHS_DAE(~,z,p)
        thetas = z(1:p.n);
        thetadots = z(p.n+1:end);
        A = Amat_DAE_4bar(p.L,p.m,thetas.');
        b = bvec_DAE_4bar(p.L,p.m,p.g,thetas.',thetadots.');
        
        c = A\b; % [xDDot;yDDot;thDDot;Fexes;Fwise]
        theta2dots = c(2*p.n+1:3*p.n);
        
        %     zdot = [xdots;ydots;thetadots;c];
        zdot = [thetadots;theta2dots];
    end


end




