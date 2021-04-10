The script within this folder demonstrates how to estimate the value of pi through Monte Carlo integration. 

-The script defines a circle within a box, where the area of the circle is around half that of the box.
-A series of random numbers following the Sobol sequence are generated and plotted within the bounds of the box. 
-Following this, the number of points which fall within the circle are counted. 
-The ratio of the number of points which fall within the circle, against the total number of points is calculated. 
-This ratio, along with the area of the box and the radius of the circle is used to estimate the value of pi via the equation; 
 pi(est)=(ratio*area)/(radius*radius).
-This script, which uses 1000 random numbers from the Sobol sequence to give 500 integration points, estimates the value of pi to be
 pi(est)=3.1875.   
 
 monte_carlo_pi.m = The main script used for the Monte Carlo estimation of pi.  
 PLOTBOX.m = A function used to plot the box.
 PLOTCIRCLE.m = A function used to plot the circle. 
 Plots_In_Box.png = A visualisation of the 500 integration points within the box.
 Plots_In_Circle.png = A visualisation of the integration points which fall within the circle. 
 sobol_thousand.txt = A list of the 1000 randomly generated numbers following the Sobol sequence.
 
 
