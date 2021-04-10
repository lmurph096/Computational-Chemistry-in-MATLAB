function PLOTBOX = PLOTBOX(x,y)

x1=-x; y1=-y;
x2=x;  y2=-y;
x3=x;  y3=y;
x4=-x; y4=y;

dx=[x1,x2,x3,x4,x1];
dy=[y1,y2,y3,y4,y1];

plot(dx,dy,'k');
axis([(1.5*-x) (1.5*x) (1.5*-y) (1.5*x)]);
end 
