%% Homework 2
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

%% problem 3a

figure(1)
clf
hold on
grid on
[x1,x2]=meshgrid(-3:0.125:3,-2:0.125:3);
x1_dot = -x1 + ( 2 * x2./ (1 + x2.^2) );
x2_dot = -x2 + ( 2 * x1./ (1 + x1.^2) );
L = sqrt(x1_dot.^2 + x2_dot.^2);
q=quiver(x1,x2,x1_dot./L,x2_dot./L,0.4);
q.Color='black';
q.AutoScale='on';
q.MaxHeadSize=0.2;
axis([-2 2 -2 2]);
xlabel('$x_1$','interpreter','Latex'); ylabel('$x_2$','interpreter','Latex')
xic = [2 -2  2 -2 -1  0  1 1.5  2   2 2 2  2 1.5 1 0 -1 -1.5 -2 -2 -2 -2];
yic = [2 -2 -2  2 -2 -2 -2 -2 -1.5 -1 0 1 1.5 2  2 2  2   2  -1  0  1 1.5];
for ic = [xic;yic]
[~,x] = ode45(@system3a,[0,12],ic);
plot(x(:,1),x(:,2),'k');
end


%% problem 3c

figure(2)
clf
hold on
grid on
[x1,x2]=meshgrid(-1:0.1:1,-1:0.1:1);
x1_dot = -x1 + 2*x2;
x2_dot = 2*x1 - x2;
L = sqrt(x1_dot.^2 + x2_dot.^2);
q=quiver(x1,x2,x1_dot./L,x2_dot./L,0.4);
q.Color='black';
q.AutoScale='on';
q.MaxHeadSize=0.2;
axis([-1 1 -1 1])
xlabel('$x_1$','interpreter','Latex'); ylabel('$x_2$','interpreter','Latex')
xic = [-1  1 0 1   1     1 -0.5 -0.75 -1  -1 0.75 0.5];
yic = [ 1 -1 1 0 -0.5 -0.75  1     1 0.75 0.5 -1  -1];
for ic = [xic;yic]
[~,x] = ode45(@system3c0,[0,9],ic);
plot(x(:,1),x(:,2),'k');
end

figure(3)
clf
hold on
grid on
[x1,x2]=meshgrid(0:0.1:2,0:0.1:2);
x1_dot = -x1 + x2;
x2_dot = x1 - x2;
L = sqrt(x1_dot.^2 + x2_dot.^2);
q=quiver(x1,x2,x1_dot./L,x2_dot./L,0.4);
q.Color='black';
q.AutoScale='on';
q.MaxHeadSize=0.2;
axis([0 2 0 2])
xlabel('$x_1$','interpreter','Latex'); ylabel('$x_2$','interpreter','Latex')
xic = [1 0.5 0.25 0   0  0 1.5 2  0  0 2 1 2];
yic = [0  0   0 0.25 0.5 1  0  0 1.5 2 1 2 2];
for ic = [xic;yic]
[~,x] = ode45(@system3c1,[0,9],ic);
plot(x(:,1),x(:,2),'k');
end

figure(4)
clf
hold on
grid on
[x1,x2]=meshgrid(-2:0.1:0,-2:0.1:0);
x1_dot = -x1 + x2;
x2_dot = x1 - x2;
L = sqrt(x1_dot.^2 + x2_dot.^2);
q=quiver(x1,x2,x1_dot./L,x2_dot./L,0.4);
q.Color='black';
q.AutoScale='on';
q.MaxHeadSize=0.2;
axis([-2 0 -2 0])
xlabel('$x_1$','interpreter','Latex'); ylabel('$x_2$','interpreter','Latex')
xic = [-1 -0.5 -0.25 0     0   0 -1.5 -2   0   0 -2 -1 -2];
yic = [ 0   0    0 -0.25 -0.5 -1   0   0 -1.5 -2 -1 -2 -2];
for ic = [xic;yic]
[~,x] = ode45(@system3c1,[0,9],ic);
plot(x(:,1),x(:,2),'k');
end


%% problem 4a

x0 = [1; 0; 0]; % define initial condition

[t,x] = ode45(@system4,[0,10],x0);  % simulate response of the system

% plot figures
figure(5)
clf
hold on
grid on
plot(t,x(:,1));
xlabel('Time (s)'); ylabel('$x_1$','interpreter','Latex')

figure(6)
clf
hold on
grid on
plot(t,x(:,2));
xlabel('Time (s)'); ylabel('$x_2$','interpreter','Latex')

figure(7)
clf
hold on
grid on
plot(t,x(:,3));
xlabel('Time (s)'); ylabel('$x_3$','interpreter','Latex')


%% Functions

%ode45 function for system 3a
function dxdt = system3a(~,x)
x1d=x(1);
x2d=x(2);
dxdt = [ (-x1d + ( 2 * x2d / (1 + x2d^2) )) ; (-x2d + ( 2 * x1d / (1 + x1d^2) )) ];
end

%ode45 function for system 3c with equilirium point at (0,0)
function dxdt = system3c0(~,x)
x1d=x(1);
x2d=x(2);
dxdt = [ (-x1d + 2*x2d) ; (2*x1d - x2d) ];
end

%ode45 function for system 3c with equilirium point at (-1,-1),(1,1)
function dxdt = system3c1(~,x)
x1d=x(1);
x2d=x(2);
dxdt = [ (-x1d + x2d) ; (x1d - x2d) ];
end

%ode45 function for system 4
function dxdt = system4(~,x)
x1=x(1);
x2=x(2);
x3=x(3);
dxdt = [ x2 ; x3 ; -2*x1 - 4*x2 - 2*x3 - x1^2 - x2^2];
end