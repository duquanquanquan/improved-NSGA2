%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  MATLAB Code for                                              %
%                                                               %
%  Non-dominated Sorting Genetic Algorithm II (NSGA-II)         %
%  Version 1.1 - November 2011                                  %
%                                                               %
%  Programmed By: S. Mostapha Kalami Heris (MatlabSite Member)  %
%                                                               %
%         e-Mail: kalami@ee.kntu.ac.ir                          %
%                 kalami@matlabsite.com                         %
%                                                               %
%       Homepage: http://www.kalami.ir                          %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function z=MyCost(x,NO)

switch NO
     case 1   
 %%%  ZDT1
        v=x;
        vg=v(:,2:30);
        gx=1+9*(sum(vg,2)/29);
        f1=v(:,1);
        f2=gx.*(1-sqrt(v(:,1)./gx));
        z=[f1
            f2];
     
    case 2  
%%%%  ZDT2
%         v=x;
%         vg=v(:,2:30);
%         gx=1+9*(sum(vg,2)/29);
%         f1=v(:,1);
%         f2=gx.*(1-(v(:,1)./gx).^2);
%         z=[f1
%             f2];
        dim=numel(x);
        z1=x(1);
        su = sum(x)-x(1);    
		g = 1 + 9 * su / (dim - 1);
        z2=g*(1 - (x(1) / g)^2);
        z=[z1
            z2];

    case 3
%%%%  ZDT3
        v=x;
        vg=v(:,2:30);
        gx=1+9*(sum(vg,2)/29);
        f1=v(:,1);
        f2=gx.*(1-sqrt(v(:,1)./gx)-(v(:,1)./gx).*sin(10*pi*v(:,1)));
        z=[f1
              f2];

    case 4
%%%%  Binh2
           dim=numel(x);
           y(1) = 4*x(1)^2+4*x(2)^2;
           y(2) =(x(1)-5)^2+(x(2)-5)^2;
           cy1=(x(1)-5)^2+x(2)^2-25;
           cy2=-(x(1)-8)^2-(x(2)-3)^2+7.7;
           cy=max(0,cy1)+max(0,cy2);
         if cy>0
             z1=10000000000;
             z2=100000000000;
         else
             z1=y(1);
             z2=y(2);
         end
        z=[z1
            z2];

    case 5        
%%%  Srinivas
            dim=numel(x);
            y(1) = (x(1)-2)^2+(x(2)-1)^2;
            y(2) =9*x(1)-(x(2)-1)^2;   
            cy1=(x(1))^2+x(2)^2-225;
            cy2=x(1)-3*x(2)+10;
            cy=max(0,cy1)+max(0,cy2);
            if cy>0
                z1=10000000000;
                z2=100000000000;
            else 
                z1=y(1);
                z2=y(2);
            end
            z=[z1
                z2];
 
    case 6           
%%%  TANAKA
            dim=numel(x);     
            y(1)=x(1);
            y(2)=x(2);
            cy1=-(x(1))^2-(x(2))^2+1-0.1*cos(16*atan(x(1)/x(2)));
            cy2=(x(1)-0.5)^2+(x(2)-0.5)^2-0.5;
            cy=max(0,cy1)+max(0,cy2);
            if cy>0
                z1=10000000000;
                z2=100000000000;
            else 
                z1=y(1);
                z2=y(2);
            end
              z=[z1
                z2];
            

    case 7
%%%% CTP1  
            dim=numel(x);
            y(1)=x(1);
            y(2)=(1+x(2))*exp(-y(1)/(1+x(2)));
            cy1=-y(2)/(0.85*exp(-0.541*y(1)))+1;
            cy2=-y(2)/(0.728*exp(-0.295*y(1)))+1;
            cy=max(0,cy1)+max(0,cy2);
         if cy>0
             z1=10000000000;
             z2=100000000000;
         else
             z1=y(1);
             z2=y(2);
         end
            z=[z1
                z2];
            
    case 8
        dim=numel(x);
        su1=0;
        su2=0;
        for i=3:2:dim
            su1=su1+(x(i)-(0.3*x(1)^2*cos(24*pi*x(1)+4*i*pi/dim)+0.6*x(1))*cos(6*pi*x(1)+i*pi/dim))^2;
        end
        for i=2:2:dim
            su2=su2+(x(i)-(0.3*x(1)^2*cos(24*pi*x(1)+4*i*pi/dim)+0.6*x(1))*sin(6*pi*x(1)+i*pi/dim))^2;
        end    
            
            
        y(1) = x(1)+2/(dim-2)*su1;
		y(2) =1-sqrt(x(1))+2/dim*su2;   
    z1= y(1);
    
    z2=y(2) ;
    z=[z1
       z2]; 
   
end
    
end