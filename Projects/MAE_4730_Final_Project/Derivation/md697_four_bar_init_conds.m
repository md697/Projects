%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT
% Solve for initial conditions for four bar linkage

function init_thDots = md697_four_bar_init_conds(p,ths,thD1, thD2, thD3)
% Pass in desired values for an angular velocity. The function will then
% solve for the other angular velocities that fit

if (~isempty(thD1) && isempty(thD2) && isempty(thD3)) % Solve for thD2 and thD3
    syms thD2 thD3 real;
    eqn = p.L(3)*thD3*[-sin(ths(3));cos(ths(3))]...
        + p.L(2)*thD2*[-sin(ths(2));cos(ths(2))]...
        + p.L(1)*thD1*[-sin(ths(1));cos(ths(1))] == zeros(2,1);
    thetadots = solve(eqn,[thD2;thD3]);
    
    init_thDots = [thD1;double(thetadots.thD2);double(thetadots.thD3)];
elseif (isempty(thD1) && ~isempty(thD2)&&  isempty(thD3)) % Solve for thD1 and and thD3
    syms thD1 thD3 real;
    eqn = p.L(3)*thD3*[-sin(ths(3));cos(ths(3))]...
        + p.L(2)*thD2*[-sin(ths(2));cos(ths(2))]...
        + p.L(1)*thD1*[-sin(ths(1));cos(ths(1))] == zeros(2,1);
    thetadots = solve(eqn,[thD1;thD3]);
    
    init_thDots = [double(thetadots.thD1);thD2;double(thetadots.thD3)];
elseif (isempty(thD1) && isempty(thD2) && ~isempty(thD3))% Solve for thD1 and thD2
    syms thD1 thD2 real;
    eqn = p.L(3)*thD3*[-sin(ths(3));cos(ths(3))]...
        + p.L(2)*thD2*[-sin(ths(2));cos(ths(2))]...
        + p.L(1)*thD1*[-sin(ths(1));cos(ths(1))] == zeros(2,1);
    thetadots = solve(eqn,[thD1;thD2]);
    
    init_thDots = [double(thetadots.thD1);double(thetadots.thD2);thD3];
else % Put in too many angular velocities by accident (or none
    % in this case, calculate initial conditions using first given thetadot
    % AND GIVE WARNING
    if ~(isempty(thD1)) % if there was a given thD1
        init_thDots = md697_four_bar_init_conds(p,ths,thD1, [], []);
        warning(['Too many initial angular velocities given. Initial '...
            'conditions were calculated using the given thD1'])
    elseif ~(isempty(thD2)) % if there was no given thD1, but a given thD2
        init_thDots = md697_four_bar_init_conds(p,ths,[], thD2, []);
        warning(['Too many initial angular velocities given. Initial '...
            'conditions were calculated using the given thD2'])
    elseif ~(isempty(thD3)) % if there were no given thD1 or thD2, but given thD3
        init_thDots = md697_four_bar_init_conds(p,ths, [], [], thD3);
        warning(['Too many initial angular velocities given. Initial '...
            'conditions were calculated using the given thD3'])
    else % no initial angular velocities given
        init_thDots = zeros(3,1);
        warning(['No initial angular velocities given. Initial '...
            'angular velocity was set to [0;0;0]'])
    end
end

end
