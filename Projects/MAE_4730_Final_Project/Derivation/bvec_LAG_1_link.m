function LAG_b = bvec_LAG_1_link(L1,m1,g,th1,thD1)
%BVEC_LAG_1_LINK
%    LAG_B = BVEC_LAG_1_LINK(L1,M1,G,TH1,THD1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    16-Dec-2017 00:34:51

LAG_b = [g.*sin(th1).*-3.0];
