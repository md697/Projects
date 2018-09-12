%% Mitchell Dominguez - md697 - MAE 4730 - FINAL PROJECT - PRESENTATION
clear;
close all;
set(0,'defaulttextinterpreter','latex');

addpath('./Derivation');
addpath('./Visualization/');
%% TRIPLE PENDULUM DEMO 1
% Set parameters
p.n = 5; % number of links
p.L = ones(1,p.n); % lengths
p.m = ones(1,p.n); % masses
p.g = 10; % acceleration due to gravity
p.I_G = (p.m .*p.L.^2)/12; % Moments of inertia of the links

% Initial Conditions
t = 10; % Time to integrate for

init_ths = pi/2*ones(1,p.n).';
% init_ths = [pi/2;pi];
init_thDots = ones(1,p.n).';
% init_thDots = [5;-2;1];

z0 = [init_ths;init_thDots]; % Initial conditions

% Solution and output settings
rederive = 0; % 1 if need to rederive EOMs. 0 if this can be skipped
plots = 0; % 1 will cause various plots to appear. 0 will suppress them

animate = 1;
% 1 will animate the pendulum and display the paths of the end points. 
% 0 will suppress this 

% Run triple pendulum
md697_run_n_pend(p,t,z0,rederive,plots,animate)



















