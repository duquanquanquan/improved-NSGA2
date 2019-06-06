%Crossover
function U=dCrossover(X,V,CR)
 [NP,Dim]=size(X);%行乘以列dim=20
   
 for i=1:NP
            jRand=floor(rand*Dim);%由于jRand要在[0,1)*Dim中取值，故而用floor
            for j=1:Dim
                if rand<CR||j==jRand
                    U(i,j)=V(i,j);
                else
                    U(i,j)=X(i,j);
                end     
            end    
        end
end

