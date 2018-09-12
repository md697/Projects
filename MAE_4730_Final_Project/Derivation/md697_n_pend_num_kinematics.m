%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT
%% N-Link Pendulum Symbolic Kinematics
% This function is called from md697_run_triple_pendulum OR
% md697_run_n_pendulum
function [rP,rG,vP,vG,aP,aG] = md697_n_pend_num_kinematics(n,th,thDot,thDDot,p)
%% Set up vectors
f1 = cell(1,n);
f2 = cell(1,n);
for i = 1:n
    f1{i} = [cos(th(:,i)).';sin(th(:,i)).';zeros(length(th(:,i)),1).']; % Tangent vectors for each body frame
    f2{i} = [-sin(th(:,i)).';cos(th(:,i)).';zeros(length(th(:,i)),1).']; % normal vectors for each body frame
%     iWf{i} = [zeros(2,length(thDot(:,i)));thDot(:,i).']; % I omega (frame)
%     iAf{i} = [zeros(2,n);thDDot.']; % I alpha (frame)
end

% Positions rel O (P1)
rG = cell(1,n);
rP = cell(1,n);
rG{1} = (p.L(1)/2)*f1{1};
rP{1} = 2*rG{1};
for i = 2:n
    rG{i} = rP{i-1} + (p.L(i)/2)*f1{i};
    rP{i} = rP{i-1} + p.L(i)*f1{i};
end

% Velocities rel O (P1)
% vG = zeros(3,n);
% vP = zeros(3,n);
% vG(:,1) = jacobian(rG(:,1),th(1))*thDot(1);
% vP(:,1) = 2*vG(:,1);
vG = cell(1,n);
vP = cell(1,n);
vG{1} = (p.L(1)/2)*[thDot(:,1).';thDot(:,1).';thDot(:,1).'].*f2{1};
vP{1} = 2*vG{1};
for i = 2:n
    %     vG{i} = vP{i-1} + jacobian(rG(:,i)-rP(:,i-1),th(i))*thDot(i);
    %     vP{i} = vP{i-1} + jacobian(rP(:,i)-rP(:,i-1),th(i))*thDot(i);
    vG{i} = vP{i-1} + (p.L(i)/2)*[thDot(:,i).';thDot(:,i).';thDot(:,i).'].*f2{i};
    vP{i} = vP{i-1} + p.L(i)*[thDot(:,i).';thDot(:,i).';thDot(:,i).'].*f2{i};
end
% 
% % Accelerations rel O (P1)
% aG = zeros(3,n);
% aP = zeros(3,n);
% aG(:,1) = jacobian(vG(:,1),[th(1) thDot(1)])*[thDot(1) thDDot(1)].';
% aP(:,1) = 2*aG(:,1);
% for i = 2:n
%     aG(:,i) = aP(:,i-1) + jacobian(vG(:,i)-vP(:,i-1),[th(i) thDot(i)])*[thDot(i) thDDot(i)].';
%     aP(:,i) = aP(:,i-1) + jacobian(vP(:,i)-vP(:,i-1),[th(i) thDot(i)])*[thDot(i) thDDot(i)].'
% end
% % aG1o = jacobian(vG1o,[th(1) thDot(1)])*[thDot(1) thDDot(1)].';
aP = 1;
aG = 1;

end
