%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - PRESENTATION
clear;
close all;
set(0,'defaulttextinterpreter','latex');

addpath('./Derivation');
addpath('./Visualization/');
%% TRIPLE PENDULUM DEMO 1
% Set parameters
p.L = [1 1 1]; % lengths
p.m = [1 1 1]; % masses
p.g = 10; % acceleration due to gravity
p.n = 3; % number of links
p.I_G = (p.m .*p.L.^2)/12; % moments of inertia of each link

t = 20; % Time to integrate for

% Set Initial Conditions
init_ths = [pi/2;pi/2;pi/2]; % Initial thetas
init_thDots = [0;0;0]; % Initial thetadots

z0 = [init_ths;init_thDots]; % Initial conditions vector

% Solution and output settings
rederive = 0; % 1 if need to rederive EOMs. 0 if this can be skipped
plots = 0; % 1 will cause various plots to appear. 0 will suppress them

animate = 1;
% 1 will animate the pendulum and display the paths of the end points. 
% 0 will suppress this 

% Run triple pendulum
md697_run_triple_pendulum(p,t,z0,rederive,plots,animate)



















