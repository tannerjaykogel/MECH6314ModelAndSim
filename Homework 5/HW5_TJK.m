%% Homework 5
% MECH 6314.001
% Tanner Kogel
clear all; clc;

%% Plot settings 
set(0,'defaultLineLineWidth', 2)
set(0,'defaultAxesFontName' , 'Times')
set(0,'defaultTextFontName' , 'Times')
set(0,'defaultAxesFontSize' , 18)
set(0,'defaultTextFontSize' , 18)
set(0,'defaulttextinterpreter','latex')
set(0,'defaultlegendinterpreter','latex')
set(0,'defaultAxesGridLineStyle','-.')

%% Problem 1

% quadratic case
Q = [2,4;4,12]; % Q matrix
b = [-2;3];     % b matrix

% set functions and variables
f=@(x) 0.5*x'*Q*x + b'*x;   % quadratic form
g=@(x) Q*x + b;             % gradient in quadratic form
x = [-5;-5];                % initial guess
num_iterations=0;           % check the number of iterations
eps = 0.00001;              % used in the stopping criterion

% run optimization
while abs(g(x)) > eps*ones(size(g(x)))      % the stopping criterion
    alpha = (g(x)'*g(x)) / (g(x)'*Q*g(x));  % get step value in steepest descent
    x = x - alpha*g(x);                     % get next step state value
    num_iterations = num_iterations+1;
end

% output results
fprintf('local minima found at: ')
x
fprintf('in %i iterations\n',num_iterations)
