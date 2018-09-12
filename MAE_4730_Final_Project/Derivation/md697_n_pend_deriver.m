%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - Triple Pendulum Deriver
%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - Triple Pendulum Deriver
% close all;
% clear;
function md697_n_pend_deriver(n)
%% Set up symbolic scalars
% n = 12; % Number of pendulum links
syms g; % acceleration due to gravity
L = sym('L', [1 n], 'positive'); % array of link lengths
m = sym('m', [1 n], 'positive'); % array of link masses
th = sym('th', [1 n], 'real'); % array of thetas
thDot = sym('thD', [1 n], 'real'); % array of theta dots
thDDot = sym('thDD', [1 n], 'real'); % array of theta double dots
xDDot = sym('xDDot', [1 n], 'real'); % x double dot of each COM
yDDot = sym('yDDot', [1 n], 'real'); % y double dot of each COM
Fx = sym('Fx', [1 n], 'real'); % Constraint forces in x direction
Fy = sym('Fy', [1 n], 'real'); % Constraint forces in y direction
I_G = (m .*L.^2)/12; % Moments of inertia about centers of mass

%% Set up symbolic vectors
f1 = [cos(th);sin(th);zeros(1,n)]; % lambda vectors for each body frame
f2 = [-sin(th);cos(th);zeros(1,n)]; % normal vectors for each body frame
e1 = [1;0;0]; % e1
e2 = [0;1;0]; % e2
e3 = [0;0;1]; % e3 (same for each frame)

iWf = [zeros(2,n);thDot]; % I omega (frame)
iAf = [zeros(2,n);thDDot]; % I alpha (frame)

%% Kinematics
% md697_triple_pendulum_kinematics % Calculate kinematics
md697_n_pend_sym_kinematics % Calculate kinematics (n link)

%% Simplifying terms
mg = e1*m.*g; % matrix of gravity force terms

IA = sym(zeros(3,n));
IA(3,:) = thDDot.*I_G; % matrix of moment of inertia * I alpha (frame) terms

ma = (diag(m) * aG.').'; % matrix of m*a terms

%% AMB Equations
% md697_triple_pendulum_AMB_eqns

%% DAE Equations
% md697_triple_pendulum_DAE_eqns

%% LAG Equations
md697_triple_pendulum_LAG_eqns

%% Generate Equations of Motion
% % AMB
% [AMB_A,AMB_b] = equationsToMatrix(AMB_eqns,thDDot);
% AMB_A = simplify(AMB_A);
% AMB_b = simplify(AMB_b);
% 
% % DAE
% [DAE_A,DAE_b] = equationsToMatrix(DAE_eqns,[xDDot, yDDot, thDDot, Fx, Fy]);
% DAE_A = simplify(DAE_A);
% DAE_b = simplify(DAE_b);

% LAG
[LAG_A,LAG_b] = equationsToMatrix(LAG_eqns,thDDot);
LAG_A = simplify(LAG_A);
LAG_b = simplify(LAG_b);


%% Create MATLAB Function for EOM
% % AMB
% matlabFunction(AMB_A,'file','Amat_AMB','Vars',{L,m,g,th,thDot});
% matlabFunction(AMB_b,'file','bvec_AMB','Vars',{L,m,g,th,thDot});
% 
% % DAE
% matlabFunction(DAE_A,'file','Amat_DAE','Vars',{L,m,th});
% matlabFunction(DAE_b,'file','bvec_DAE','Vars',{L,m,g,th,thDot});

% DAE
matlabFunction(LAG_A,'file',['Amat_LAG_',num2str(n),'_link'],'Vars',{L,m,th});
matlabFunction(LAG_b,'file',['bvec_LAG_',num2str(n),'_link'],'Vars',{L,m,g,th,thDot});









end