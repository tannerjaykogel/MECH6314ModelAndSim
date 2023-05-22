%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Direction Field and Phase Portrait for the Simple Pendulum
% Mark W. Spong
% March 20, 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
clf
clear
[x,y]=meshgrid(-6.2:0.25:6.2,-3:0.25:3);
u = y;
v =-sin(x);
L = sqrt(u.^2 + v.^2);    %normalize the length of the arrows
q=quiver(x,y,u./L,v./L,0.4);
hold on
q.Color='black';
q.AutoScale='on';
q.MaxHeadSize=0.2;
axis([-6.2 6.2 -3 3]);
xic = [-6.0 -6.0 -6.0 -6 -2.98 -1 -1.5 6 6 6 -6 -2];
yic = [2.5 1.5 1.98 -2.5 0 0 0 -1.5 -1.98 -2.5 -1.5 0];
for ic = [xic;yic]
[t,x] = ode45(@pend,[0,22],ic);
plot(x(:,1),x(:,2),'k');
end
function dxdt = pend(~,x) % the simple pendulum equation
q1=x(1);
q1d=x(2); % x2 dot = .... q doubledot
dxdt = [q1d;-sin(q1)];
end
