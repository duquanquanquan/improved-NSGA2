function [pop F]=NonDominatedSorting(pop)

    nPop=numel(pop);

    F{1}=[];
    
    for i=1:nPop
        pop(i).DominatedCount=0;
        pop(i).DominationSet=[];
        
        for j=[1:i-1 i+1:nPop]
            
            if Dominates(pop(i),pop(j))
                pop(i).DominationSet=[pop(i).DominationSet j];
                
            elseif Dominates(pop(j),pop(i))
                pop(i).DominatedCount=pop(i).DominatedCount+1;
                
            end
            
        end
        
        if pop(i).DominatedCount==0
            F{1}=[F{1} i];
        end
        
    end
    
    k=1;
    
    while true
        
        Q=[];
        
        for i=F{k}
            for j=pop(i).DominationSet
                pop(j).DominatedCount=pop(j).DominatedCount-1;
                
                if pop(j).DominatedCount==0
                    Q=[Q j];
                end
            end
        end
        
        if isempty(Q)
            break;
        end
        
        F{k+1}=Q;
        k=k+1;
        
    end
    
    for k=1:numel(F)
        for i=F{k}
            pop(i).Rank=k;
        end
    end
    
end