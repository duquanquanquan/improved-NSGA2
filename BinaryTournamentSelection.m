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

function i=BinaryTournamentSelection(pop)

    ii=randperm(numel(pop));
    
    i1=ii(1);
    i2=ii(2);
    
    if pop(i1).Rank<pop(i2).Rank
        i=i1;
        
    elseif pop(i2).Rank<pop(i1).Rank
        i=i2;
        
    else
        if pop(i1).CrowdingDistance>pop(i2).CrowdingDistance
            i=i1;
        else
            i=i2;
        end
    end
    
end