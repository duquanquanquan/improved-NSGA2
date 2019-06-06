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

function [pop F]=SortPopulation(pop)

    % Sort according to Crowding Distance
    CD=[pop.CrowdingDistance];
    [CD CDSO]=sort(CD,'descend');
    pop=pop(CDSO);
    
    % Sort according to Rank
    R=[pop.Rank];
    [R RSO]=sort(R,'ascend');
    pop=pop(RSO);
    
    n=numel(pop);
    for i=1:n
        R(i)=pop(i).Rank;
    end
    
    Min_R=min(R);
    Max_R=max(R);

    F=cell(1,Max_R);
    emp_sit=[];

    for ii=1:Max_R

        F{ii}=find(R==ii);
        if ~isempty(F{ii})==1
            emp_sit=[emp_sit ii];
        end
    end

%     num=length(emp_sit);
%     FF=cell(1,num);
%     for jj=1:num
%         FF{jj}=F{emp_sit(jj)};
%     end


end