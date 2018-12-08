function OutVec = getBearLine(px,py,ang)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
curY = 0;
ox = px;
oy = py;
lineX = [];
lineY = [];
lx = px+(20*cosd(ang));
ly = py+(20*sind(ang));
sx = lx-px;
sy = ly-py;
m = sy/sx;
% while curY < 100
%     lineX = [lineX ox];
%     lineY = [lineY curY];
%     curY = m*(ox-px) + py;
%     ox = ox+.01;
% end
if m > 0
    for i = 1:5000
        lineX = [lineX ox];
        lineY = [lineY oy];    
        ox = ox + .01;
        oy = m*(ox-px) + py;
    end
elseif m < 0
    for i = 1:5000
        lineX = [lineX ox];
        lineY = [lineY oy];    
        ox = ox - .01;
        oy = m*(ox-px) + py;
    end
end
OutVec = [lineX; lineY];
end

