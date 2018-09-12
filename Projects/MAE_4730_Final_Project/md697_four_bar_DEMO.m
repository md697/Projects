%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - PRESENTATION
clear;
close all;
set(0,'defaulttextinterpreter','latex');

addpath('./Derivation');
addpath('./Visualization/');
%% FOUR BAR LINKAGE DEMO 1
% Set parameters
p.L = [2 1 .5]; % lengths
% p.L = [1 1 2];
p.m = [1 1 3]; % masses
p.g = 5; % acceleration due to gravity
p.n = 3; % number of links
p.I_G = (p.m .*p.L.^2)/12; % moments of inertia of each link

t = 20; % Time to integrate for

% Set initial conditions
init_ths = [pi-1/64;pi/2;0]; % initial theta vector
% FILL IN ONE OF thD1,thD2,or thD3 and pass in [] for the other values
% init_thDots = md697_four_bar_init_conds(p,init_ths,thD1, thD2, thD3)

% Initial theta dots,
init_thD1 = [];
init_thD2 = [];
init_thD3 = [2];

init_thDots = md697_four_bar_init_conds(p,init_ths,init_thD1, init_thD2, init_thD3);

z0 = [init_ths;init_thDots];

% Solution and output settings
rederive = 0; % 1 if need to rederive EOMs. 0 if this can be skipped
plots = 0; % 1 will cause various plots to appear. 0 will suppress them

animate = 1;
% 1 will animate the pendulum and display the paths of the end points. 
% 0 will suppress this 

md697_run_four_bar_linkage(p,t,z0,rederive,plots,animate)





