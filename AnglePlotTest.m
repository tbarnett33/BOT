clf
clear all
curY = 0;
ex = 50;
ey = 75;
px = 10;
py = 20;
ox = px;
oy = py;
lineX = [];
lineY = [];

cx = ex-px;
cy = ey-py;

ang = atand(cy/cx);
lx = px+(100*cosd(ang));
ly = py+(100*sind(ang));
sx = lx-px;
sy = ly-py;
m = sy/sx;
while curY < 100
    lineX = [lineX ox];
    lineY = [lineY curY];
    curY = m*(ox-px) + py;
    ox = ox+.01;
end
hold on
scatter(ex,ey)
plot(lineX,lineY)

