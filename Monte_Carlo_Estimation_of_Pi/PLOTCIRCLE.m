function PLOTCIRCLE = PLOTCIRCLE(x,y,r)

hold on
ang=0:0.01:2*pi;
xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp,'k')

end 

