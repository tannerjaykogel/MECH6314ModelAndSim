%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Direction Field and a Trajectory for the
% Simple Pendulum
% Mark W. Spong
% February 5, 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
[x,y]=meshgrid(-2:0.25:2,-2:0.25:2);
u=y;
v=-x;
L=sqrt(u.^2 + v.^2); % normalize the length of the arrows
q=quiver(x,y,u./L,v./L,0.4);
hold on
q.Color='black';
q.AutoScale='on';
q.MaxHeadSize=0.2;
axis([-2 2 -2 2]);
axis square
th = linspace(0,2*pi);
xc = sin(th);
yc = cos(th);
plot(xc,yc,'k');
r = linspace(0,pi/2,20);
v = sin(r);
w = sqrt(1-v.^2);
plot(v,w,'Color','k')
hold on
p = plot(v(1),w(1),'o','Color','k','MarkerFaceColor','red');
%
axis manual
for k = 2:length(v)
    p.XData = v(k);
    p.YData = w(k);
    drawnow
end
for i=1:4
r = linspace(pi/2,pi,20);
v = sin(r);
w = -sqrt(1-v.^2);
plot(v,w,'Color','k')
hold on
%
axis manual
for k = 2:length(v)
    p.XData = v(k);
    p.YData = w(k);
    drawnow
end
r = linspace(pi,3*pi/2,20);
v = sin(r);
w = -sqrt(1-v.^2);
plot(v,w,'Color','k')
hold on
%
axis manual
for k = 2:length(v)
    p.XData = v(k);
    p.YData = w(k);
    drawnow
end
r = linspace(3*pi/2,2*pi,20);
v = sin(r);
w = sqrt(1-v.^2);
plot(v,w,'Color','k')
hold on
%
axis manual
for k = 2:length(v)
    p.XData = v(k);
    p.YData = w(k);
    drawnow 
end
r = linspace(0,pi/2,20);
v = sin(r);
w = sqrt(1-v.^2);
plot(v,w,'Color','k')
hold on
%
axis manual
for k = 2:length(v)
    p.XData = v(k);
    p.YData = w(k);
    drawnow
end
end