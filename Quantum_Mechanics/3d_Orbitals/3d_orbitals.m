%Coordinates of box where orbital will be plotted.
%Limits of box lie between -18 au, and +18 au in steps of 0.2 au. 
%(au = atomic units)
x=-18:0.2:18;
y=x;
z=x;

n=3;  %Principal quantum number = 3 for 3d orbitals.

%Loop over the x,y,z coordinates to evaluate the radial coordinate 'r', and
%the parameter 'rho' which contributes to the radial component of the
%wavefunction.
for i=1:length(x)
    for j=1:length(y)
        for k=1:length(z)
            r=sqrt((x(i)*x(i))+(y(j)*y(j))+(z(k)*z(k)));
            rho=(2*r/n);
            
            ang_norm=(sqrt(1/(4*pi)));                         %The normailsation factor for the angular component of the 3d wavefunctions.
            rad_wav=(1/(9*sqrt(30)))*rho*rho*exp(-rho/2);      %The radial component of the 3d wavefunctions. 
            
            psi3dxy(i,j,k)=rad_wav*ang_norm*sqrt(60/4)*((x(i)*y(j))/(r*r));       %The total 3dxy,3dxz,3dyz,3dx2_y2, and 3d_z2 wavefuntions are the radial component (rad_wav)   
            psi3dxz(i,j,k)=rad_wav*ang_norm*sqrt(60/4)*((x(i)*z(k))/(r*r));       % * the angular components (ang_norm*sqrt(60/4)*((x(i)*y(j))/(r*r))(in the case of the 3dxy orbital).
            psi3dyz(i,j,k)=rad_wav*ang_norm*sqrt(60/4)*((y(j)*z(k))/(r*r));
            psi3d_x2y2(i,j,k)=rad_wav*ang_norm*sqrt(15/4)*(((x(i)*x(i))-(y(j)*y(j)))/(r*r));
            psi3d_z2(i,j,k)=rad_wav*ang_norm*sqrt(5/4)*(((2*z(k)*z(k))-(x(i)*x(i))-(y(j)*y(j)))/(r*r));
        end 
    end 
end 

%Isosurface commands to plot the 3dxy,3dxz,3dyz,3dx2_y2,and 3d_z2 orbitals over the cartesian coordinates
%defined, using isosurface values of ±0.005. 
figure
isosurface(x,y,z,psi3dxy,0.005);
isosurface(x,y,z,psi3dxy,-0.005);
title('3d_xy orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u.)');
box on
grid on
axis equal

figure(2)
isosurface(x,y,z,psi3dxz,0.005);
isosurface(x,y,z,psi3dxz,-0.005);
title('3d_xz orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(3)
isosurface(x,y,z,psi3dyz,0.005);
isosurface(x,y,z,psi3dyz,-0.005);
title('3d_yz orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(4)
isosurface(x,y,z,psi3d_x2y2,0.005);
isosurface(x,y,z,psi3d_x2y2,-0.005);
title('3d_x2y2 orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(5)
isosurface(x,y,z,psi3d_z2,0.005);
isosurface(x,y,z,psi3d_z2,-0.005);
title('3d_z2 orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal