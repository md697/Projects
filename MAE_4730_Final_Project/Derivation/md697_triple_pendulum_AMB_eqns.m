%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT
% ANGULAR MOMENTUM BALANCE EQUATIONS
% About O (P1)
Mo = cross(rG1o,mg(:,1)) + cross(rG2o,mg(:,2)) + cross(rG3o,mg(:,3));
HDo = sum(IA(:,1:n),2) + cross(rG1o,ma(:,1)) + cross(rG2o,ma(:,2)) + cross(rG3o,ma(:,3));
AMB_eqns{1} = simplify(Mo(3) == HDo(3));

% About P2
Mp2 = cross(rG2p2,mg(:,2)) + cross(rG3p2,mg(:,3));
HDp2 = sum(IA(:,2:n),2) + cross(rG2p2,ma(:,2)) + cross(rG3p2,ma(:,3));
AMB_eqns{2} = simplify(Mp2(3) == HDp2(3));

% About P3
Mp3 = cross(rG3p3,mg(:,3));
HDp3 = sum(IA(:,3:n),2) + cross(rG3p3,ma(:,3));
AMB_eqns{3} = simplify(Mp3(3) == HDp3(3));
