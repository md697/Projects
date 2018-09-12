%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT
% LAGRANGE EQUATIONS
% Set up Lagrangian (triple pendulum specific)
% Ek = (1/2)*m(1)*dot(vG1o,vG1o) + (1/2)*I_G(1)*thDot(1)^2 ...
%     + (1/2)*m(2)*dot(vG2o,vG2o) + (1/2)*I_G(2)*thDot(2)^2 ...
%     + (1/2)*m(3)*dot(vG3o,vG3o) + (1/2)*I_G(3)*thDot(3)^2;
% Ep = -m(1)*g*rG1o(1) - m(2)*g*rG2o(1) - m(3)*g*rG3o(1);

% Ek = 0; % initialize kinetic energy
% Ep = 0; % initialize potential energy
syms Ek Ep
for i = 1:n
   Ek = Ek + 0.5*m(i)*dot(vG(:,i),vG(:,i)) + 0.5*I_G(i)*thDot(i)^2;
   Ep = Ep - m(i)*g*rG(1,i);
end

Lag = Ek-Ep;

% Equations
LAG_eqns = simplify(jacobian(Lag, th.').' ...
    -  jacobian(jacobian(Lag,thDot).',[th thDot])*[thDot thDDot].' ...
    == zeros(n,1));
