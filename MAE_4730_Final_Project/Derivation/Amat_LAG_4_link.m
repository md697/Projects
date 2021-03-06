function LAG_A = Amat_LAG_4_link(in1,in2,in3)
%AMAT_LAG_4_LINK
%    LAG_A = AMAT_LAG_4_LINK(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    07-Dec-2017 19:51:44

L1 = in1(:,1);
L2 = in1(:,2);
L3 = in1(:,3);
L4 = in1(:,4);
m1 = in2(:,1);
m2 = in2(:,2);
m3 = in2(:,3);
m4 = in2(:,4);
th1 = in3(:,1);
th2 = in3(:,2);
th3 = in3(:,3);
th4 = in3(:,4);
t2 = m4.*2.0;
t3 = th1-th2;
t4 = cos(t3);
t5 = m3.*2.0;
t6 = m2+t2+t5;
t7 = m3.*3.0;
t8 = m4.*3.0;
t9 = m3+t2;
t10 = th1-th3;
t11 = cos(t10);
t12 = th2-th3;
t13 = cos(t12);
t14 = th1-th4;
t15 = cos(t14);
t16 = th2-th4;
t17 = cos(t16);
t18 = th3-th4;
t19 = cos(t18);
LAG_A = reshape([L1.*(m1+m2.*3.0+t7+t8).*2.0,L1.*t4.*t6.*3.0,L1.*t9.*t11.*3.0,L1.*t15.*-3.0,L2.*t4.*t6.*3.0,L2.*(m2+t7+t8).*2.0,L2.*t9.*t13.*3.0,L2.*t17.*-3.0,L3.*t9.*t11.*3.0,L3.*t9.*t13.*3.0,L3.*(m3+t8).*2.0,L3.*t19.*-3.0,L4.*m4.*t15.*3.0,L4.*m4.*t17.*3.0,L4.*m4.*t19.*3.0,L4.*-2.0],[4,4]);
