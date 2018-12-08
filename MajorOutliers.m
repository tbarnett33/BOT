function [xo,yo] = MajorOutliers(x,y)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
outliersX = [];
outliersY = [];
v2 = x;
v3 = y;
[v2s, firstsortorder] = sort(v2);
v3s = v3(firstsortorder);

oph = .1;
opl = .1;
sz = size(v3s, 2);
A = mean(v2s);
B = mean(v3s);

for i = 1:sz
    if v2s(i) > 1.5*A
        outliersX = [outliersX i];
    end
end
v2s(outliersX) = [];
v3s(outliersX) = [];
for b = 1:size(v3s,2)
    if v3s(b) > 1.5*B
        outliersY = [outliersY b];
    end
end
v2s(outliersY) = [];
v3s(outliersY) = [];
xo = v2s;
yo = v3s;
end

