%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - Triple Pendulum Kinematics
% This script works with md697_triple_pendulum_deriver.m

% G1/O
rG1o = (L(1)/2)*f1(:,1);
vG1o = jacobian(rG1o,th(1))*thDot(1);
aG1o = jacobian(vG1o,[th(1) thDot(1)])*[thDot(1) thDDot(1)].';

% P2/O
rP2o = 2*rG1o;
vP2o = 2*vG1o;
aP2o = 2*aG1o;

% G2/P2
rG2p2 = (L(2)/2)*f1(:,2);
vG2p2 = jacobian(rG2p2,th(2))*thDot(2);
aG2p2 = jacobian(vG2p2,[th(2) thDot(2)])*[thDot(2) thDDot(2)].';

% G2/O
rG2o = rP2o + rG2p2;
vG2o = vP2o + vG2p2;
aG2o = aP2o + aG2p2;

% P3/P2
rP3p2 = 2*rG2p2;
vP3p2 = 2*vG2p2;
aP3p2 = 2*aG2p2;

% P3/O
rP3o = rP2o + rP3p2;
vP3o = vP2o + vP3p2;
aP3o = aP2o + aP3p2;

% G3/P3
rG3p3 = (L(3)/2)*f1(:,3);
vG3p3 = jacobian(rG3p3,th(3))*thDot(3);
aG3p3 = jacobian(vG3p3,[th(3) thDot(3)])*[thDot(3) thDDot(3)].';

% G3/O
rG3o = rP3o + rG3p3;
vG3o = vP3o + vG3p3;
aG3o = aP3o + aG3p3;

% G3/P2
rG3p2 = rP3p2 + rG3p3;
vG3p2 = vP3p2 + vG3p3;
aG3p2 = aP3p2 + aG3p3;

% P4/O
rP4o = rP3o + 2*rG3p3;
vP4o = vP3o + 2*vG3p3;
aP4o = aP3o + 2*aG3p3;



