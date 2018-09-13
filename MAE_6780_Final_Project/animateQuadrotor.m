%% Animate the Quadrotor
function animateQuadrotor(state,XDes,filename,animate)
% Unpack state object
t   = state.Time;
x      = state.Data(:,1);
% dx     = state.Data(:,2);
y      = state.Data(:,3);
% dy     = state.Data(:,4);
z      = state.Data(:,5);
% dz     = state.Data(:,6);
phi    = state.Data(:,7);
% dphi   = state.Data(:,8);
theta  = state.Data(:,9);
% dtheta = state.Data(:,10);
psi    = state.Data(:,11);
% dpsi   = state.Data(:,12);

tdes = XDes(:,1);
xdes = XDes(:,2);
ydes = XDes(:,4);
zdes = XDes(:,6);
phides = XDes(:,8);
thetades = XDes(:,10);
psides = XDes(:,12);

%% Set up figure
fig = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,4,[1 2 5 6])
axsize = 2;
axis([-axsize axsize -axsize axsize -axsize axsize])
axis square
axis off
hold on
view(135,20)
% view(3)

subplot(4,4,[9 10 13 14])


subplot(4,4,[1 2 5 6])


%% Defining axes
xaxisref = [0 1;0 0;0 0];
yaxisref = [0 0;0 1;0 0];
zaxisref = [0 0;0 0;0 1];

%% Setting up line objects for each axis in top left figure
subplot(4,4,[1 2 5 6])
xaxis = line('xdata',xaxisref(1,:),'ydata',xaxisref(2,:),...
    'zdata',xaxisref(3,:),'color','black','LineWidth',2);
yaxis = line('xdata',yaxisref(1,:),'ydata',yaxisref(2,:),...
    'zdata',yaxisref(3,:),'color','black','LineWidth',2);
zaxis = line('xdata',zaxisref(1,:),'ydata',zaxisref(2,:),...
    'zdata',zaxisref(3,:),'color','black','LineWidth',2);
title('Quadrotor Attitude (dotted black = intertial, solid black = body, red = desired)')


%% Plot Inertial Frame in top left figure
subplot(4,4,[1 2 5 6])
iSize = 3;
plot3(iSize*xaxisref(1,:),iSize*xaxisref(2,:),iSize*xaxisref(3,:),'k--','LineWidth',2);
plot3(iSize*yaxisref(1,:),iSize*yaxisref(2,:),iSize*yaxisref(3,:),'k--','LineWidth',2);
plot3(iSize*zaxisref(1,:),iSize*zaxisref(2,:),iSize*zaxisref(3,:),'k--','LineWidth',2);

%% Setting up line objects for each axis in top left figure
subplot(4,4,[1 2 5 6])
xaxis = line('xdata',xaxisref(1,:),'ydata',xaxisref(2,:),...
    'zdata',xaxisref(3,:),'color','black','LineWidth',2);
yaxis = line('xdata',yaxisref(1,:),'ydata',yaxisref(2,:),...
    'zdata',yaxisref(3,:),'color','black','LineWidth',2);
zaxis = line('xdata',zaxisref(1,:),'ydata',zaxisref(2,:),...
    'zdata',zaxisref(3,:),'color','black','LineWidth',2);

subplot(4,4,[1 2 5 6])
xaxisdes = line('xdata',xaxisref(1,:),'ydata',xaxisref(2,:),...
    'zdata',xaxisref(3,:),'color','red','LineWidth',2);
yaxisdes = line('xdata',yaxisref(1,:),'ydata',yaxisref(2,:),...
    'zdata',yaxisref(3,:),'color','red','LineWidth',2);
zaxisdes = line('xdata',zaxisref(1,:),'ydata',zaxisref(2,:),...
    'zdata',zaxisref(3,:),'color','red','LineWidth',2);



%% Plot Inertial Frame in top left figure
subplot(4,4,[1 2 5 6])
iSize = 3;
plot3(iSize*xaxisref(1,:),iSize*xaxisref(2,:),iSize*xaxisref(3,:),'k--','LineWidth',2);
plot3(iSize*yaxisref(1,:),iSize*yaxisref(2,:),iSize*yaxisref(3,:),'k--','LineWidth',2);
plot3(iSize*zaxisref(1,:),iSize*zaxisref(2,:),iSize*zaxisref(3,:),'k--','LineWidth',2);

%% Defining pretty box in top left figure
subplot(4,4,[1 2 5 6])
vertices = [-0.75 -0.75 -0.125] + ...
           [0 0 0;
            0 0 0.25;
            0 1.5 0.25;
            0 1.5 0;
            1.5 1.5 0;
            1.5 1.5 0.25;
            1.5 0 0.25;
            1.5 0 0];
faces = [1 2 3 4;5 6 7 8;2 3 6 7;1 4 5 8;1 2 7 8;3 4 5 6];
facecol = [0;1;2;3;4;5];

%% Plot desired axes in top left figure
% subplot(4,4,[1 2 5 6])
% phival = XDes(:,7);
% thetaval = XDes(:,9);
% psival = XDes(:,11);
% A = [1 0 0;0 cos(phival) -sin(phival);0 sin(phival) cos(phival)];
% B = [cos(thetaval) 0 sin(thetaval);0 1 0;-sin(thetaval) 0 cos(thetaval)];
% C = [cos(psival),-sin(psival) 0; sin(psival) cos(psival) 0; 0 0 1];
% 
% iCb = A*B*C;
% 
% b1des_I = iCb*[1.5;0;0];
% b2des_I = iCb*[0;1.5;0];
% b3des_I = iCb*[0;0;1.5];
% 
% plot3([0 b1des_I(1,:)],[0 b1des_I(2,:)],[0 b1des_I(3,:)],'r-','LineWidth',2);
% plot3([0 b2des_I(1,:)],[0 b2des_I(2,:)],[0 b2des_I(3,:)],'r-','LineWidth',2);
% plot3([0 b3des_I(1,:)],[0 b3des_I(2,:)],[0 b3des_I(3,:)],'r-','LineWidth',2);             


%% Set up patch object in top left figure
p = patch('vertices',vertices-0.5,'faces',faces,...
    'facevertexcdata',facecol,'FaceColor','flat', 'FaceAlpha',.5);

drawnow
tic
tnow = toc;

%% Set up bottom left figure
subplot(4,4,[9 10 13 14])
hold on
axis( [min(x)-0.1*max(x), 1.1*max(x), ...
    min(y)-0.1*max(y), 1.1*max(y), ...
    min(z)-0.1*max(z), 1.1*max(z)]);
view(135,20)
xlabel('x (m)')
ylabel('y (m)')
zlabel('z (m)')
title('Quadrotor Trajectory')
grid on


%% Set up COM marker in bottom left figure
subplot(4,4,[9 10 13 14])
CM = line('xdata',0,'ydata',0,'zdata',0,'color','black','marker','.','MarkerSize',30);
% CMtrack = line('xdata',0,'ydata',0,'zdata',0,'color','red','marker','.',...
%     'LineWidth',2,'MarkerSize',10);

%% Plot figures on right side
subplot(4,4,[3 4])
hold on
plot(t,phi,'k','LineWidth',1)
plot(tdes,phides,'r--','LineWidth',1)
hold off
title('$\phi$ vs. Time');
xlabel('t (s)');
ylabel('$\phi$ (rad)');

subplot(4,4,[7 8])
hold on
plot(t,theta,'k','LineWidth',1)
plot(tdes,thetades,'r--','LineWidth',1)
hold off
title('$\theta$ vs. Time');
xlabel('t (s)');
ylabel('$\theta$ (rad)');

subplot(4,4,[11 12])
hold on
plot(t,psi,'k','LineWidth',1)
plot(tdes,psides,'r--','LineWidth',1)
hold off
title('$\psi$ vs. Time');
xlabel('t (s)');
ylabel('$\psi$ (rad)');

subplot(4,4,[15 16])
hold on
plot(t,z,'k','LineWidth',1)
plot(tdes,zdes,'r--','LineWidth',1)
hold off
xlabel('t (s)')
ylabel('z (rad)')
title('z vs. Time')

%% Set up Moving Markers on Right Side
subplot(4,4,[3 4])
phi_marker = line('xdata',t(1),'ydata',phi(1),'color','black','marker','.','MarkerSize',20);

subplot(4,4,[7 8])
theta_marker = line('xdata',t(1),'ydata',theta(1),'color','black','marker','.','MarkerSize',20);

subplot(4,4,[11 12])
psi_marker = line('xdata',t(1),'ydata',psi(1),'color','black','marker','.','MarkerSize',20);

subplot(4,4,[15 16])
z_marker = line('xdata',t(1),'ydata',z(1),'color','black','marker','.','MarkerSize',20);

scale = 1; % Longer scale means slower animation
i = 1;

if animate == 1
    f = getframe;
    [im,map] = rgb2ind(f.cdata,256,'nodither');
    im(1,1,1,20) = 0;
end
k = 1;

%% Loop through animation
while tnow/scale<=t(end)
    %% Interpolate configuration of quadrotor   
    tval = interp1(t*scale,t,tnow);
    xval = interp1(t*scale,x,tnow);
    yval = interp1(t*scale,y,tnow);
    zval = interp1(t*scale,z,tnow);
    phival = interp1(t*scale,phi,tnow);
    thetaval = interp1(t*scale,theta,tnow);
    psival = interp1(t*scale,psi,tnow);
    
    xval_vec(k) = xval;
    yval_vec(k) = yval;
    zval_vec(k) = zval;
    
    xdesval = interp1(tdes*scale,xdes,tnow);
    ydesval = interp1(tdes*scale,ydes,tnow);
    zdesval = interp1(tdes*scale,zdes,tnow);
    phidesval = interp1(tdes*scale,phides,tnow);
    thetadesval = interp1(tdes*scale,thetades,tnow);
    psidesval = interp1(tdes*scale,psides,tnow);
    
    %% Desired triad
   
    Ades = [1 0 0;0 cos(phidesval) -sin(phidesval);0 sin(phidesval) cos(phidesval)];
    Bdes = [cos(thetadesval) 0 sin(thetadesval);0 1 0;-sin(thetadesval) 0 cos(thetadesval)];
    Cdes = [cos(psidesval),-sin(psidesval) 0; sin(psidesval) cos(psidesval) 0; 0 0 1];
    
    iCbdes = Ades*Bdes*Cdes;
    
    b1des_I = iCbdes*[1.5;0;0];
    b2des_I = iCbdes*[0;1.5;0];
    b3des_I = iCbdes*[0;0;1.5];
    
    %% Set rotation matrix
    A = [1 0 0;0 cos(phival) -sin(phival);0 sin(phival) cos(phival)];
    B = [cos(thetaval) 0 sin(thetaval);0 1 0;-sin(thetaval) 0 cos(thetaval)];
    C = [cos(psival),-sin(psival) 0; sin(psival) cos(psival) 0; 0 0 1];
    
    iCb = A*B*C;
    
    b1_I = iCb*[1;0;0];
    b2_I = iCb*[0;1;0];
    b3_I = iCb*[0;0;1];
    
    %% Plot Height in Bottom Left Figure
    subplot(4,4,[9 10 13 14])
%     set(CMtrack,'xdata',xval_vec(1:i),'ydata',yval_vec(1:i),'zdata',zval_vec(1:i),'color','red',...
%     'LineWidth',2,'MarkerSize',30,'LineStyle','-');
    set(CM,'xdata',xval,'ydata',yval,'zdata',zval,'color','black','markers',30)
    plot3(xval,yval,zval,'r.','markers',5)
    
    
    %% Plot Moving Points on Right Side
    subplot(4,4,[3 4])
    set(phi_marker,'xdata',tval,'ydata',phival,'color','black','marker','.','MarkerSize',20)
    
    subplot(4,4,[7 8])
    set(theta_marker,'xdata',tval,'ydata',thetaval,'color','black','marker','.','MarkerSize',20)
    
    subplot(4,4,[11 12])
    set(psi_marker,'xdata',tval,'ydata',psival,'color','black','marker','.','MarkerSize',20)
    
    subplot(4,4,[15 16])
    set(z_marker,'xdata',tval,'ydata',zval,'color','black','marker','.','MarkerSize',20)
    
    %% Calculate New Box Coordinates in top left figure
    subplot(4,4,[1 2 5 6])
    vert = vertices;
    for i = 1:8
        temp = (iCb*vert(i,:).').';
        vert(i,:) = temp;
    end
    
    p.Vertices = vert;
    
    xval = 0;
    yval = 0;
    zval = 0;
    set(xaxis,'Xdata',[xval, xval+b1_I(1)],...
        'Ydata',[yval, yval+b1_I(2)],...
        'Zdata',[zval, zval+b1_I(3)]);
    set(yaxis,'Xdata',[xval, xval+b2_I(1)],...
        'Ydata',[yval, yval+b2_I(2)],...
        'Zdata',[zval, zval+b2_I(3)]);
    set(zaxis,'Xdata',[xval, xval+b3_I(1)],...
        'Ydata',[yval, yval+b3_I(2)],...
        'Zdata',[zval, zval+b3_I(3)]);
    
    subplot(4,4,[1 2 5 6])
	xvaldes = 0;
    yvaldes = 0;
    zvaldes = 0;
    
    set(xaxisdes,'Xdata',[xvaldes, xvaldes+b1des_I(1)],...
        'Ydata',[yvaldes, yvaldes+b1des_I(2)],...
        'Zdata',[zvaldes, zvaldes+b1des_I(3)]);
    set(yaxisdes,'Xdata',[xvaldes, xvaldes+b2des_I(1)],...
        'Ydata',[yvaldes, yvaldes+b2des_I(2)],...
        'Zdata',[zvaldes, zvaldes+b2des_I(3)]);
    set(zaxisdes,'Xdata',[xvaldes, xvaldes+b3des_I(1)],...
        'Ydata',[yvaldes, yvaldes+b3des_I(2)],...
        'Zdata',[zvaldes, zvaldes+b3des_I(3)]);
    
%     plot3([0 b1des_I(1,:)],[0 b1des_I(2,:)],[0 b1des_I(3,:)],'r-','LineWidth',2);
%     plot3([0 b2des_I(1,:)],[0 b2des_I(2,:)],[0 b2des_I(3,:)],'r-','LineWidth',2);
%     plot3([0 b3des_I(1,:)],[0 b3des_I(2,:)],[0 b3des_I(3,:)],'r-','LineWidth',2);
    
    drawnow
    tnow = toc;
    
%     frame = getframe(1);
%     im = frame2im(frame);
%     [imind,cm] = rgb2ind(im,256);
%     if i == 1
%         imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
%     else
%         imwrite(imind,cm,filename,'gif');
%     end
%     
    % Write to the GIF File
    if animate == 1
        frame = getframe(gcf);
        im = frame2im(frame); 
        [imind,cm] = rgb2ind(im,256);

        if k == 1 
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
        else 
            imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0); 
        end 
    end
       
   k = k+1;
end

end





