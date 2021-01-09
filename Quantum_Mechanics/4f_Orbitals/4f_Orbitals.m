%Coordinates of box where orbital will be plotted.
%Limits of box lie between -36 au, and +36 au in steps of 0.5 au. 
%(au = atomic units)
x=-36:0.5:36;
y=x;
z=x;

n=4; %Principal quantum number = 4 for 4f orbitals.

for i=1:length(x)
    for j=1:length(y)
        for k=1:length(z)
            r=sqrt((x(i)*x(i))+(y(j)*y(j))+(z(k)*z(k)));
            rho=(2*r/n);
            
            rad_wav=(1/(96*sqrt(35)))*rho*rho*rho*exp(-rho/2);    %The radial component of the 4f wavefunctions. 
            ang_norm=(sqrt(1/(4*pi)));                            %The normailsation factor for the angular component of the 4f wavefunctions.
            
            psi4f_x3(i,j,k)=rad_wav*ang_norm*sqrt(7/4)*((x(i)*((5*x(i)*x(i))-(3*r*r)))/(r*r*r));        %The total 4fx3,4fy3,4fz3,4fx(z2_y2),4fy(z2_x2),4fz(x2_y2),and 4f_xyz wavefuntions  
            psi4f_y3(i,j,k)=rad_wav*ang_norm*sqrt(7/4)*((y(j)*((5*y(j)*y(j))-(3*r*r)))/(r*r*r));        %are the radial component (rad_wav)* the angular components;   
            psi4f_z3(i,j,k)=rad_wav*ang_norm*sqrt(7/4)*((z(k)*((5*z(k)*z(k))-(3*r*r)))/(r*r*r));        %(ang_norm*sqrt(7/4)*((x(i)*((5*x(i)*x(i))-(3*r*r)))/(r*r*r)) (in the case of the 4fx3 orbital)
            psi4f_xz2y2(i,j,k)=rad_wav*ang_norm*sqrt(105/4)*((x(i)*((z(k)*z(k))-(y(j)*y(j))))/(r*r*r)); 
            psi4f_yz2x2(i,j,k)=rad_wav*ang_norm*sqrt(105/4)*((y(j)*((z(k)*z(k))-(x(i)*x(i))))/(r*r*r));
            psi4f_zx2y2(i,j,k)=rad_wav*ang_norm*sqrt(105/4)*((z(k)*((x(i)*x(i))-(y(j)*y(j))))/(r*r*r));
            psi4f_xyz(i,j,k)=rad_wav*ang_norm*sqrt(105/4)*((x(i)*y(j)*z(k))/(r*r*r));
        end 
    end 
end 

%Isosurface commands to plot the 4fx3,4fy3,4fz3,4fx(z2_y2),4fy(z2_x2),4fz(x2_y2),and 4f_xyz orbitals over the cartesian coordinates
%defined, using isosurface values of ±0.002. 
figure;
isosurface(x,y,z,psi4f_x3,0.002);
isosurface(x,y,z,psi4f_x3,-0.002);
title('4f_x3 orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(2);
isosurface(x,y,z,psi4f_y3,0.002);
isosurface(x,y,z,psi4f_y3,-0.002);
title('4f_y3 orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(3);
isosurface(x,y,z,psi4f_z3,0.002);
isosurface(x,y,z,psi4f_z3,-0.002);
title('4f_z3 orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(4);
isosurface(x,y,z,psi4f_xz2y2,0.002);
isosurface(x,y,z,psi4f_xz2y2,-0.002);
title('4f_x(z2-y2) orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(5);
isosurface(x,y,z,psi4f_yz2x2,0.002);
isosurface(x,y,z,psi4f_yz2x2,-0.002);
title('4f_y(z2-x2) orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(6);
isosurface(x,y,z,psi4f_zx2y2,0.002);
isosurface(x,y,z,psi4f_zx2y2,-0.002);
title('4f_z(x2-y2) orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal

figure(7);
isosurface(x,y,z,psi4f_xyz,0.002);
isosurface(x,y,z,psi4f_xyz,-0.002);
title('4f_xyz orbital');
xlabel('X(a.u)');
ylabel('Y(a.u)');
zlabel('Z(a.u)');
box on
grid on
axis equal