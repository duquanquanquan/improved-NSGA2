function pop=CalcCrowdingDistance(pop,F)

    for k=1:numel(F)
        
        C=[pop(F{k}).Cost];
        
        nObj=size(C,1);
        
        nFk=numel(F{k});
        
        D=zeros(nFk,nObj);
        
        for j=1:nObj
            
            Cj=C(j,:);
            
            [SortedCj SortOrder]=sort(Cj);
            
            D(SortOrder(1),j)=inf;
            D(SortOrder(end),j)=inf;
            
            Cjmin=SortedCj(1);
            Cjmax=SortedCj(end);
            
            for i=2:nFk-1
                D(SortOrder(i),j)=(SortedCj(i+1)-SortedCj(i-1))/(Cjmax-Cjmin);
            end
            
        end
        
        for i=1:nFk
            pop(F{k}(i)).CrowdingDistance=sum(D(i,:))/nObj;
        end
        
    end

end