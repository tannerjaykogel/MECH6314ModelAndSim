%% Homework 3
% MECH 6314.001
% Tanner Kogel
clear all; clc

%% Plot settings 
set(0,'defaultLineLineWidth', 2)
set(0,'defaultAxesFontName' , 'Times')
set(0,'defaultTextFontName' , 'Times')
set(0,'defaultAxesFontSize' , 18)
set(0,'defaultTextFontSize' , 18)
set(0,'defaulttextinterpreter','latex')
set(0,'defaultlegendinterpreter','latex')
set(0,'defaultAxesGridLineStyle','-.')

%% Problem 6

T = 12;             % total length of simulation
N = T;              % number of time steps in simulation
t = linspace(1,T,N);% array of time values
x = zeros(2,N);     % state value vector with N appearances
x(:,1) = [2 ; 0];   % initial state value
y = zeros(1,N);     % output value scalar with N appearances
u = 1;              % constant input term
fig = 0;            % start figure indexing

% define discrete system dynamics
A = [  0   1;
     -1/4 3/4];
B = [0 ; 1];
C = [1 , 0];

y(1) = C*x(:,1);    % initial output value

% simulate system
for k = 2:N
    x(:,k) = A*x(:,k-1) + B*u;  % state space definition of next time step
    y(k) = C*x(:,k);            % state space definition of output
end

fig = fig+1;% next figure index
figure(fig) % open new figure
clf;        % clear figure
grid on     % use grid on chart
box on      % keep shape of chart
hold on     % allow for multiple plots
plot(t,y,'LineWidth',2) % plot output over time
% provide appropriate titles for axes
xlabel('Time Step (k)'); ylabel('Output$(y)$','Interpreter','latex')
title('System (6) Output')  % provide appropriate title for graph
xlim([1 12])                % get accurate window to show simulation


%% Problem 7

T = 40;             % total length of simulation
N = T;              % number of time steps in simulation
N = N + 1;          % account for time step 0
t = linspace(0,T,N);% array of time values
x = zeros(3,N);     % state value vector with N appearances
x(:,1) = [10;1;-1]; % initial state value
y = zeros(1,N);     % output value scalar with N appearances

% define discrete system dynamics
A = [  0    1    0;
       0    0    1;
      0.3 -0.5 -0.2];
C = [1 , 0, 0];

y(1) = C*x(:,1);    % initial output value

% simulate system
for k = 2:N
    x(:,k) = A*x(:,k-1);% state space definition of next time step
    y(k) = C*x(:,k);    % state space definition of output
end

fig = fig+1;% next figure index
figure(fig) % open new figure
clf;        % clear figure
grid on     % use grid on chart
box on      % keep shape of chart
hold on     % allow for multiple plots
plot(t,y,'LineWidth',2) % plot output over time
% provide appropriate titles for axes
xlabel('Time Step (k)'); ylabel('Output$(y)$','Interpreter','latex')
title('System (7) Output')  % provide appropriate title for graph


%% Problem 9

T = 10;             % total length of simulation
N = T;              % number of time steps in simulation
N = N + 1;          % account for time step 0
t = linspace(0,T,N);% array of time values
x = zeros(2,N);     % state value vector with N appearances
y = zeros(1,N);     % output value scalar with N appearances
% define set of initial conditions
x0 = [0  1  1  0 -1 -1  1 -1;
      1  0  1 -1  0 -1 -1  1];

% define discrete system dynamics
A = [ 0 1;
     -1 0];
C = [1 , 0];

for i = 1:length(x0(1,:))   % loop over all initial conditions
    x(:,1) = x0(:,i);       % set new initial condition

    y(1) = C*x(:,1);    % initial output value
    
    % simulate system
    for k = 2:N
        x(:,k) = A*x(:,k-1);% state space definition of next time step
        y(k) = C*x(:,k);    % state space definition of output
    end
    
    fig = fig+1;% next figure index
    figure(fig) % open new figure
    clf;        % clear figure
    grid on     % use grid on chart
    box on      % keep shape of chart
    hold on     % allow for multiple plots
    plot(t,y,'LineWidth',2) % plot output over time
    % provide appropriate titles for axes
    xlabel('Time Step (k)'); ylabel('Output$(y)$','Interpreter','latex')
    title('System (9) Output')  % provide appropriate title for graph
end


%% Problem 10

T = 5;                                  % total length of simulation
N = T;                                  % number of time steps in simulation
N = N + 1;                              % account for time step 0
t = linspace(0,T,N);                    % array of time values
x = zeros(1,N);                         % state value vector with N appearances
x(1)= input('initial condition = ');    % get initial condition from user
a= input('coefficient a = ');           % get coefficient from user
n= input('power n = ');                 % get power from user

% simulate system
for k = 2:N
    x(k) = a*(x(k-1))^n;    % definition of next time step
end

fig = fig+1;% next figure index
figure(fig) % open new figure
clf;        % clear figure
grid on     % use grid on chart
box on      % keep shape of chart
hold on     % allow for multiple plots
plot(t,x,'LineWidth',2) % plot output over time
% provide appropriate titles for axes
xlabel('Time Step (k)'); ylabel('Output$(y)$','Interpreter','latex')
title('System (10) Output')  % provide appropriate title for graph


%% Problem 11

set(0,'defaultLineLineWidth', 0.5)  % change linewidth
x0=0.1;                             % initial condition
N = 5;                              % number of iterations
x(1) = x0;
for ic=1:N
x(ic+1) = -x(ic)^3+0.4;
end
% plot the map function and the line y=x
fig = fig+1;            % next figure index
figure(fig)             % open new figure
clf;                    % clear figure
grid on                 % use grid on chart
box on                  % keep shape of chart
hold on                 % allow for multiple plots
t = 0:0.01:1;           % define time steps
plot(t,-t.^3+0.4,'k');  % plot x(k+1) as function of x(k)
axis([0 0.5 0 0.5]);    % set appropriate window size
set(gca,'XTick',(0:0.1:1),'YTick',(0:0.1:1))
fplot(@(y)1.*y,[0 1],'k');

% plot the cobweb
line([x(1) x(1)],[0 x(2)],'Color','k')
plot(x(1), x(1))
for ic=1:N-1
line([x(ic) x(ic+1)],[x(ic+1) x(ic+1)],'Color','k')
line([x(ic+1) x(ic+1)],[x(ic+1) x(ic+2)],'Color','k')
plot(x(ic+1), x(ic+1),'ko');
end
plot(x(N+1),x(N+1),'ko');
line([x(N) x(N+1)],[x(N+1) x(N+1)],'Color','k')