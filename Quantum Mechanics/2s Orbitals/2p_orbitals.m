%Coordinates of box where orbital will be plotted.
%Limits of box lie between -6 au, and +6 au in steps of 0.1 au. 
%(au = atomic units)
x=-6:0.1:6;
y=x;
z=x;

n=2; %Principal quantum number = 2 for 2p orbitals.


%Loop over the x,y,z coordinates to evaluate the radial coordinate 'r', and
%the parameter 'rho' which contributes to the radial component of the
%wavefunction.
for i=1:length(x)
    for j=1:length(y)
        for k=1:length(z)
            r=sqrt((x(i)*x(i))+(y(j)*y(j))+(z(k)*z(k)));
            rho=(2*r/n);
            ang_norm=(sqrt(1/(4*pi)));                     %The normailsation factor for the angular component of the 2p wavefunctions.
            rad_wav=(1/(2*sqrt(6)))*rho*exp(-rho/2);       %The radial component of the 2p wavefunctions. 
            
            psi_2px(i,j,k)=rad_wav*ang_norm*sqrt(3)*(x(i)/r);  %The total 2px,2py,2pz wavefuntions are the radial component (rad_wav) * the   
            psi_2py(i,j,k)=rad_wav*ang_norm*sqrt(3)*(y(j)/r);  %angular components (ang_norm*sqrt(3)*(x(i)/r))(in the case of the 2px orbital).
            psi_2pz(i,j,k)=rad_wav*ang_norm*sqrt(3)*(z(k)/r);      
        end 
    end 
end 

%Isosurface commands to plot the 2px,2py,2pz orbitals over the cartesian coordinates
%defined, using isosurface values of ±0.03. 
figure;
isosurface(x,y,z,psi_2px,0.03);
isosurface(x,y,z,psi_2px,-0.03);
title('Hydrogen 2px orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal


figure(2);
isosurface(x,y,z,psi_2py,0.03);
isosurface(x,y,z,psi_2py,-0.03);
title('Hydrogen 2py orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(3);
isosurface(x,y,z,psi_2pz,0.03);
isosurface(x,y,z,psi_2pz,-0.03);
title('Hydrogen 2pz orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal