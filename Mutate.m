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

function y=Mutate(x,mu,pm,VarRange)

    VarMin=VarRange(:,1);
    VarMax=VarRange(:,2);
    
    sigma=pm*(VarMax-VarMin);
%     xnew=x+sigma*randn(size(x));
%     xnew=min(max(xnew,VarMin),VarMax);
	 for i=1:size(x,2)
        xnew(i)=x(i)+sigma(i)*rand;
        xnew(i)=min(max(xnew(i),VarMin(i)),VarMax(i));
     end	
   
    n=numel(x);
    m=ceil(mu*n);
    jj=randsample(n,m);
    
    y=x;
    y(jj)=xnew(jj);
    
end