%This script demonstrates the use of Monte Carlo integration to estimate
%the value of pi. 

%Define the integration box and circle
dx=1.0; 
dy=1.0; 
area=dx*dy;
radius=0.4;  %circle is around half of the area of the box (pi*0.4^2=0.50)

%Creation of a set of integration points which populate the box, from a set
%of pre-computed random numbers from the Sobol sequence. The Sobol sequence
%ensures that the box is filled in a uniform manner:
S=load('sobol_thousand.txt');
Npts=length(S)/2;

%X contains the first 500 numbers in S, Y contains the last 500 numbers. 
X=S(1:Npts); Y=S(Npts+1:Npts*2);

%Take the mean of the numbers in each array, and subtract from each number
%individually. This ensures each number is between +0.5, and -0.5 (the
%limits of the box). Multiplying by dx and dy is important if these values =/= 1.
X=dx*(X-mean(X)); Y=dy*(Y-mean(Y));

PLOTBOX(dx/2,dy/2);      %A function to plot the box.
hold on;              
PLOTCIRCLE(0,0,radius);  %A function to plot the circle. 

if (Npts<=1000) 
    scatter(X(1:Npts),Y(1:Npts),'b');  %Fill the box and circle with the integration points.
end 

%With all the integration points defined, determine which points are within
%the circle. 
inCircle=0;
dist=sqrt(X.*X+Y.*Y); %Distance from origin of circle, to an integration point.

%For each of the points, determine if the distance from each point to
%the origin of the circle is less than or equal to than the radius of the
%circle
for i=1:Npts
    if(dist(i)<=radius)
        inCircle=inCircle+1;
        if (Npts<=1000)
            scatter(X(i),Y(i),'r'); %Visualise the integration points within the circle.
        end 
    end 
end 

ratio=inCircle/Npts;
piEst=(ratio*area)/(radius*radius);
%piEst = 3.1875



