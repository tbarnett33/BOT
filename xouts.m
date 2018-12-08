function [xo,yo] = xouts(x,y,p)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
[v2s, firstsortorder] = sort(x);
v3s = y(firstsortorder);
oph = p/2;
opl = p/2;
sz = size(v2s,2)
hrp = round(oph*sz);
lrp = round(opl*sz);
bot = lrp + 1;
v3s = v3s';
v2s = v2s';
v3sf = v3s(:,bot:end);
v2sf = v2s(:,bot:end);
sz2 = size(v2sf,2);
top = sz2 - hrp;
v2sf = v2sf(:,1:top);
v3sf = v3sf(:,1:top);
display ('removed outliers x')
display(top)
[v5s, firstsortorder] = sort(v3sf);
v4s = v2sf(firstsortorder);
hrp2 = round(oph*size(v2sf,2));
bot2 = hrp2+1;
v5sf = v5s(:,bot2:end);
v4sf = v4s(:,bot2:end);
top2 = size(v4sf,2) - hrp2;
v4sf = v4sf(:,1:top2);
v5sf = v5sf(:,1:top2);


xo = v4sf;
yo = v5sf;
end

