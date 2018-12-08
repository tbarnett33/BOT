clf
clear all
%Globals----------
bearLines = [];
bearLinesNoise = [];
bl = [];
inRange = [];
intersects = [];
angles =[];
Noise = [];
anglesNoise = [];
bearErr = 5;
bearLinesOutX = [];
bearLinesOutY = [];
intersects2X = [];
intersects2Xa = [];
intersects2Y = [];
intersects2Ya = [];
%-----------------

% Create FlightPath--------
x = 0:2:100;
sz = size(x,2);
y = 22*ones(1,sz);
%-----------------------

%place Emitter---------
EmLocX = 50;
EmLocY = 70;
%----------------------

%Emitter Range---------
r = 50; %emitter range
th = 0:pi/50:2*pi;
xunit = r * cos(th) + EmLocX;
yunit = r * sin(th) + EmLocY;
%----------------------

%Check if point is in range --------
gx = [];
gy = [];
for k = 1:sz
    dis =  sqrt((EmLocX-x(k))^2+(EmLocY - y(k))^2);
    if dis < r
        gx = [gx x(k)];
        gy = [gy y(k)];
    end       
end
inRange = [gx; gy];
NumInRange = size(inRange,2);
%-----------------------------------
%Create Ideal Bearings Angles-------------
for k = 1:NumInRange
    cx = EmLocX - gx(k);
    cy = EmLocY - gy(k);
    newAng = atand(cy/cx);
    if cx < 0 && cy > 0
        newAng = newAng + 180;
    elseif cx < 0 && cy < 0
        newAng = newAng + 180;
        
    elseif cx >= 0 && cy < 0
        newAng = newAng + 360;
    end
    angles = [angles newAng];
end
%----------------------------------
%Create Ideal Bearing Lines--------
for i = 1:NumInRange
    bl = getBearLine(gx(i),gy(i),angles(i));
    bearLines = [bearLines; bl];
end
sp = size(bearLines,1);
%----------------------------------

%Create Noise Vector------------
numNoise = size(angles,2);
for p = 1:numNoise
    w = (rand(1)-.5)*bearErr;
    Noise = [Noise w];
end

%-------------------------------
%Add Noise to Bearing angles-------
anglesNoise = angles+Noise;
%----------------------------------

%Generate Noise Lines --------
for s = 1:NumInRange 
    bl = getBearLine(gx(s),gy(s),anglesNoise(s));
    bearLinesNoise = [bearLinesNoise; bl];
end
%------------------------------

%Find Intersections-----------
for iter = 1:2:sp
    for iter2 = iter+2:2:sp
        P = InterX([bearLinesNoise(iter,:);bearLinesNoise(iter+1,:)],[bearLinesNoise(iter2,:);bearLinesNoise(iter2+1,:)]);
        intersects = [intersects; P'];
        display (iter)
        display (iter2)
    end
end
%-----------------------------

%Remove Outliers---------
[intersects2X,intersects2Y] = MajorOutliers(intersects(:,1),intersects(:,2));
[intersects2Xa,intersects2Ya] = xouts(intersects2X,intersects2Y,.1);
%------------------------

%Plot Situation-1-------
hold on
plot(x,y)
axis([0 100 0 100])
scatter(EmLocX,EmLocY,'b')
plot(xunit,yunit)
title('Bearings Only Localization')
xlabel('East/West (nm)')
ylabel('South/North (nm)')
for pl = 1:2:sp
  plot(bearLinesNoise(pl,:),bearLinesNoise(pl+1,:),'k')
end
scatter(intersects(:,1),intersects(:,2),'x','r')
E = fit_ellipse(intersects(:,1),intersects(:,2),figure(1));
%------------------------------
%plot situation 2----------
figure (2)
hold on
plot(x,y)
axis([0 100 0 100])
scatter(EmLocX,EmLocY,'b')
plot(xunit,yunit)
title('Bearings Only Localization Outlier Scan')
xlabel('East/West (nm)')
ylabel('South/North (nm)')
for pl = 1:2:sp
  plot(bearLinesNoise(pl,:),bearLinesNoise(pl+1,:),'k')
end
scatter(intersects2Xa,intersects2Ya,'x','r')
E2 = fit_ellipse(intersects2Xa,intersects2Ya,figure(2));
%----------------------------