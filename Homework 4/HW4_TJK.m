%% Homework 4
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

% define standard values
x_0 = -3;               % begin point
x_f = 3;                % end point
delta_x = x_f - x_0;    % length of simulation
h = 0.01;               % time step value
N = delta_x/h;          % number of time steps in simulation
x = linspace(x_0,x_f,N);% array of x values
f = x.^3;               % function value at each time step
f_prime = zeros(1,N-1); % derivative value at each time step
x_trim = zeros(1,N-1);  % x values for derivative
fig = 0;                % figure number

% forward difference approximation
for i = 1:N-1
    x_trim(i) = x(i);                   % accurate x values (missing final time step)
    f_prime(i) = ( f(i+1) - f(i) ) / h; % get derivative value at each time step
end
fig = fig+1;                                % new figure
doplot(fig,x,x_trim,f,f_prime);             % plot output
title('Forward Difference Approximation');  % title graph by type

% backward difference approximation
for i = 2:N
    x_trim(i-1) = x(i);                   % accurate x values (missing final time step)
    f_prime(i-1) = ( f(i) - f(i-1) ) / h; % get derivative value at each time step
end
fig = fig+1;                                % new figure
doplot(fig,x,x_trim,f,f_prime);             % plot output
title('Backward Difference Approximation'); % title graph by type

% middle difference approximation
f_prime = zeros(1,N-2); x_trim = zeros(1,N-2);  % get correct size arrays
for i = 2:N-1
    x_trim(i-1) = x(i);                         % accurate x values (missing final time step)
    f_prime(i-1) = ( f(i+1) - f(i-1) ) / 2 / h; % get derivative value at each time step
end
fig = fig+1;                                % new figure
doplot(fig,x,x_trim,f,f_prime);             % plot output
title('Middle Difference Approximation');   % title graph by type


%% Problem 2

% define standard values
x_0 = 0;                    % begin point
x_f = 1;                    % end point
n = 10;                     % number of steps
h = (x_f - x_0) / n;        % time step value
x = linspace(x_0,x_f,n+1);  % array of x values
f = x.^3 + 2 * x;           % function value at each time step
summation = 0;              % initialize summation value at 0

for i = 0:n
    if i == 0 || i == n     % first and last time steps
        a = 1;              % coeficcient of 1
    elseif mod(i,2) == 0    % even time steps
        a = 2;              % coefficient of 2
    else                    % odd time steps
        a = 4;              % coefficient of 4
    end
    summation = summation + a*f(i+1);   % add apropriate value to summation
end
area = h * summation / 3


%% Problem 3

fig = fig+1;
figure(fig)
clf
hold on
grid on
set(0,'defaultLineLineWidth', 0.5)
% Euler predictor-corrector example
f = @(x,t)-t*x^2;
t0 = 0; t_f = 1;
x0 = 2; % initial condition
h = 0.1; % step size
x = x0; % initialize x
xout = x; % initialize output
t_array = t0:h:t_f;
for t = t0 : h : t_f-h
xtilde = x+h*f(x,t); % predictor step
x = x + 1/2*h*(f(x,t) + f(xtilde,t+h)); % corrector step
xout = [xout;x];
end

% get actual response of system
x_t = t0:h:t_f;
n = (t_f-t0)/h;
for i = 0:n
    x_t(i+1) = 2 * x0 / (2 + x0 * t_array(i+1)^2);
end

% Euler predictor-corrector example
% Compare with the explicit Euler method
y = x0;
yout = y;
for t = t0 : h : t_f-h
y = y+h*f(y,t);
yout = [yout;y];
end
plot(t_array,x_t,'k',t_array,xout,'k+',t_array,yout,'ko')
xlabel('$t$','Interpreter','Latex')
ylabel('$x$','Interpreter','Latex')
legend('Actual','Predictor-Correcter','Euler')


%% Problem 5

Ka = [1 2 4];           % list of amplifier gain values
t = linspace(0,20,500); % time array

% open new figure and format
fig = fig+1;
figure(fig)
clf
hold on
grid on
set(0,'defaultLineLineWidth', 2)

for i = 1:3 % loop over all amplifier gains
    a = 0.5*Ka(i);
    sys = tf(a,[1 2 a]);    % create system model
    y = step(sys,t);        % get output of step response
    plot(t,y)               % plot output
end

% add labels to plots
legend('$K_{a} = 1$','$K_{a} = 2$','$K_{a} = 4$','Location','best','Interpreter','Latex')
xlabel('$t$','Interpreter','Latex')
ylabel('$y(t)$','Interpreter','Latex')
title('System 5 Step Response')


%% Problem 6


t = linspace(0,2,100);              % time array
P = tf(1,[1,1]);                    % open loop transfer function
k_i = 2.25;                         % integral gain
k_p = 2*sqrt(k_i)-1;                % proportional gain
sys = tf([k_p,k_i],[1,k_p+1,k_i]);  % create system as transfer function
y = step(sys,t);                    % get output of step response

% plot output
fig = fig+1;
figure(fig)
clf
hold on
grid on
plot(t,y)
xlabel('$t$','Interpreter','Latex')
ylabel('$y(t)$','Interpreter','Latex')
title('System 6 Step Response')


%% Functions

% plot output
function [] = doplot(fig,x,x_trim,f,f_prime)
    figure(fig)
    clf
    hold on
    grid on
    plot(x,f);
    plot(x_trim,f_prime);
    legend('$f(x)$','$\frac{df(x)}{dx}$','Location','best')
    xlabel('$x$','interpreter','Latex')
end



