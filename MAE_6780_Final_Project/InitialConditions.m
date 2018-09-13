V1_WP = ( (sqrt(m*g/4/bb)*2*pi/60) - b1 )/a1;
V2_WP = ( (sqrt(m*g/4/bb)*2*pi/60) - b2 )/a2;
V3_WP = ( (sqrt(m*g/4/bb)*2*pi/60) - b3 )/a3;
V4_WP = ( (sqrt(m*g/4/bb)*2*pi/60) - b4 )/a4;

d_omega_R10=V1_WP;           % motor 1. rotor
d_omega_R20=V2_WP;           % motor 2. rotor
d_omega_R30=V3_WP;           % motor 3. rotor
d_omega_R40=V4_WP;           % motor 4. rotor

x_0 = 0;                     % position in x - axis
dx_0 = 0;                    % linear velocity in x - axis
y_0 = 0;                     % position in y - axis
dy_0 = 0;                    % linear velocity in y - axis
z_0 = 10;                     % position in z - axis
dz_0 = 5;                    % linear velocity in z - axis
fi_0 = pi;                 % roll 
dfi_0 = 0;                   % roll rate
theta_0 = 0;              % pitch 
dtheta_0 = 0;             % pitch rate
psi_0 = 0;                % yaw 
dpsi_0 = 0;                  % yaw rate
