% Tuning Parameters.m

kd_z = 10;
kd_phi = 10;
kd_theta = 10;
kd_psi = 10;

% s = (dXdes-dX)+lambda_x*(Xdes-X)+Ki*int(Xdes-X)dtau
% Proportional
lambda_z     = 50/kd_z; 
lambda_phi   = 50/kd_phi;
lambda_theta = 50/kd_theta;
lambda_psi   = 50/kd_psi;

lambda_x   = 150;
lambda_y   = 150;

lambda = [lambda_z lambda_phi lambda_theta lambda_psi lambda_x lambda_y].';

% Kappa
k_z     = 5/kd_z; 
k_phi   = 5/kd_phi;
k_theta = 5/kd_theta;
k_psi   = 5/kd_psi;

K = [k_z k_phi k_theta k_psi].';

% delta_z     = 0.3; 
% delta_phi   = 0.3;
% delta_theta = 0.3;
% delta_psi   = 0.3;
% 
% delta = [delta_z delta_phi delta_theta delta_psi].';

% Eta
eta_z     = 20/kd_z; 
eta_phi   = 20/kd_phi;
eta_theta = 20/kd_theta;
eta_psi   = 20/kd_psi;

eta = [eta_z eta_phi eta_theta eta_psi].';

tau_z     = .01;
tau_phi   = .1e+3;
tau_theta = .1e+3;
tau_psi   = .1e+3;

tau = 1e1*[tau_z tau_phi tau_theta tau_psi].';

% Integral
lambdai_z     = 400/kd_z; 
lambdai_phi   = 200/kd_phi;
lambdai_theta = 200/kd_theta;
lambdai_psi   = 100/kd_psi;

lambdai_x   = 1500;
lambdai_y   = 1500;

lambdai = 10*[lambdai_z lambdai_phi lambdai_theta lambdai_psi lambdai_x lambdai_y].';

clear kd_z kd_phi kd_theta kd_psi

save('TuningParameters.mat')