function DAE_A = Amat_DAE_4bar(in1,in2,in3)
%AMAT_DAE_4BAR
%    DAE_A = AMAT_DAE_4BAR(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    16-Dec-2017 01:26:29

L1 = in1(:,1);
L2 = in1(:,2);
L3 = in1(:,3);
m1 = in2(:,1);
m2 = in2(:,2);
m3 = in2(:,3);
th1 = in3(:,1);
th2 = in3(:,2);
th3 = in3(:,3);
t2 = sin(th1);
t3 = L1.*t2.*(1.0./2.0);
t4 = cos(th1);
t5 = sin(th2);
t6 = cos(th2);
t7 = L2.*t6.*(1.0./2.0);
t8 = sin(th3);
t9 = cos(th3);
t10 = L3.*t9.*(1.0./2.0);
t11 = L1.*t4.*(1.0./2.0);
t12 = L1.*t2;
t13 = L2.*t5;
DAE_A = reshape([-m1,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-m2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-m3,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,-m2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-m2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-m3,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,L1.^2.*m1.*(-1.0./1.2e1),0.0,0.0,t3,-t11,t12,-L1.*t4,t12,-L1.*t4,-t12,L1.*t4,0.0,0.0,0.0,0.0,0.0,0.0,0.0,L2.^2.*m2.*(-1.0./1.2e1),0.0,0.0,0.0,L2.*t5.*(1.0./2.0),-t7,t13,-L2.*t6,-t13,L2.*t6,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,L3.^2.*m3.*(-1.0./1.2e1),0.0,0.0,0.0,0.0,L3.*t8.*(1.0./2.0),-t10,-L3.*t8,L3.*t9,1.0,0.0,0.0,0.0,0.0,0.0,t3,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,-1.0,0.0,0.0,0.0,-t3,L2.*t5.*(-1.0./2.0),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,-1.0,0.0,0.0,L2.*t5.*(-1.0./2.0),L3.*t8.*(-1.0./2.0),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,L3.*t8.*(-1.0./2.0),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,L1.*t4.*(-1.0./2.0),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,-1.0,0.0,0.0,t11,t7,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,-1.0,0.0,t7,t10,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,t10,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[17,17]);
