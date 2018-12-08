
% v2 = [1 2 3 4 3 2 1 2 3 4 5 6 7 8 9 10 9 8 7 6 7 8 9 8 25 2];
% v3 = [3 4 5 6 7 8 9 10 9 8 7 6 7 8 9 10 11 12 11 10 11 10 9 8 8 30];
outliersX = [];
outliersY = [];

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


% hrp = round(oph*sz);
% lrp = round(opl*sz);
% bot = lrp + 1;
% v3sf = v3s(:,bot:end);
% v2sf = v2s(:,bot:end);
% sz2 = size(v2sf,2);
% top = sz2 - hrp;
% v2sf = v2sf(:,1:top);
% v3sf = v3sf(:,1:top);



