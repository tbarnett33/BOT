%Ellipse TEst
clf
figure(1)

x= [0;2;6;10;12;8;4;1;3;5;4;5;7]; 
y= [2;6;10;10;4;0;-2;4;6;7;8;-3;5]; 
hold on
scatter (x,y)
E = fit_ellipse(x,y,figure(1));
title('Best Fit Ellipse')
xlabel('East/West (nm)')
ylabel('South/North (nm)')
axis([0 100 0 100])

