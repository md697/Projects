%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT
%% N-Link Pendulum Symbolic Kinematics
% This script works with md697_triple_pendulum_deriver.m

% Positions rel O (P1)
rG = sym(zeros(3,n)); % r_Gi/o
rP = sym(zeros(3,n)); % r_Pi/o
rG(:,1) = (L(1)/2)*f1(:,1);
rP(:,1) = 2*rG(:,1);
for i = 2:n
    rG(:,i) = rP(:,i-1) + (L(i)/2)*f1(:,i);
    rP(:,i) = rP(:,i-1) + L(i)*f1(:,i);
end

% Velocities rel O (P1)
vG = sym(zeros(3,n));
vP = sym(zeros(3,n));
vG(:,1) = jacobian(rG(:,1),th(1))*thDot(1);
vP(:,1) = 2*vG(:,1);
for i = 2:n
    vG(:,i) = vP(:,i-1) + jacobian(rG(:,i)-rP(:,i-1),th(i))*thDot(i);
    vP(:,i) = vP(:,i-1) + jacobian(rP(:,i)-rP(:,i-1),th(i))*thDot(i);
end

% Accelerations rel O (P1)
aG = sym(zeros(3,n));
aP = sym(zeros(3,n));
aG(:,1) = jacobian(vG(:,1),[th(1) thDot(1)])*[thDot(1) thDDot(1)].';
aP(:,1) = 2*aG(:,1);
for i = 2:n
    aG(:,i) = aP(:,i-1) + jacobian(vG(:,i)-vP(:,i-1),[th(i) thDot(i)])*[thDot(i) thDDot(i)].';
    aP(:,i) = aP(:,i-1) + jacobian(vP(:,i)-vP(:,i-1),[th(i) thDot(i)])*[thDot(i) thDDot(i)].';
end
% aG1o = jacobian(vG1o,[th(1) thDot(1)])*[thDot(1) thDDot(1)].';














