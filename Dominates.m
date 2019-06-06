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

function flag=Dominates(x,y)

    if isfield(x,'Cost')
        x=x.Cost;
    end
    
    if isfield(y,'Cost')
        y=y.Cost;
    end    

    flag=all(x<=y) && any(x<y);

end