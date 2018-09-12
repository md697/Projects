%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT
% DAE EQUATIONS
% LMB link 1
DAE_eqns{1} = Fx(1) + m(1)*g + Fx(2) == m(1)*xDDot(1);
DAE_eqns{2} = Fy(1) + Fy(2) == m(2)*yDDot(1);

% LMB link 2
DAE_eqns{3} = -Fx(2) + m(2)*g + Fx(3) == m(2)*xDDot(2);
DAE_eqns{4} = -Fy(2) + Fy(3) == m(2)*yDDot(2);

% LMB link 3 
DAE_eqns{5} = -Fx(3) + m(3)*g == m(3)*xDDot(3);
DAE_eqns{6} = -Fy(3) == m(3)*yDDot(3);

% AMB link 1
temp_7 = -(L(1)/2)*cross(f1(:,1),Fx(1)*e1 + Fy(1)*e2)...
    + (L(1)/2)*cross(f1(:,1),Fx(2)*e1 + Fy(2)*e2);
DAE_eqns{7} = temp_7(3) == IA(3,1);

% AMB link 2
temp_8 = -(L(2)/2)*cross(f1(:,2),-Fx(2)*e1 - Fy(2)*e2)...
    + (L(2)/2)*cross(f1(:,2),Fx(3)*e1 + Fy(3)*e2);
DAE_eqns{8} = temp_8(3) == IA(3,2);

% AMB link 3
temp_9 = -(L(3)/2)*cross(f1(:,3),-Fx(3)*e1 - Fy(3)*e2);
DAE_eqns{9} = temp_9(3) == IA(3,3);

% Constraint COM 1
DAE_eqns{10} = xDDot(1) == aG1o(1);
DAE_eqns{11} = yDDot(1) == aG1o(2);

% Constraint COM 2
DAE_eqns{12} = xDDot(2) == aG2o(1);
DAE_eqns{13} = yDDot(2) == aG2o(2);

% Constraint COM 3
DAE_eqns{14} = xDDot(3) == aG3o(1);
DAE_eqns{15} = yDDot(3) == aG3o(2);





