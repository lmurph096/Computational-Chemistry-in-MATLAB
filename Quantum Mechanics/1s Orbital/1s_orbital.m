%Coordinates of box where orbital will be plotted.
%Limits of box lie between -1 au, and +1 au in steps of 0.1 au. 
%(au = atomic units)
x=-1:0.1:1; 
y=x;
z=x;
 
n=1; %Principal quantum number = 1 for 1s orbital.

ang=sqrt(1/(4*pi)); %The angular factor of the 1s orbital wavefunction.

%Loop over the x,y,z coordinates to evaluate the radial coordinate 'r', and
%the parameter 'rho' which contributes to the radial component of the
%wavefunction.
for i=1:length(x)
    for j=1:length(y)
        for k=1:length(z)
            r=sqrt((x(i)*x(i))+(y(j)*y(j))+(z(k)*z(k)));
            rho=(2*r/n);
             psi1s(i,j,k)=ang*2*exp(-rho/2); %The total 1s wavefunction is the angular component (ang), multiplied by the radial
        end                                  %component (2*exp(-rho/2)).
    end 
end

%Isosurface commands to plot the 1s orbital over the cartesian coordinates
%defined, using isosurface values of ±0.25. 
isosurface(x,y,z,psi1s,0.25);
isosurface(x,y,x,psi1s,-0.25);



