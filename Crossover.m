function [y1 y2]=Crossover(x1,x2,VarRange)
%     VarRange=VarRange';
    VarMin=min(VarRange);
    VarMax=max(VarRange);

    gamma=0.2;
    alpha=unifrnd(-gamma,1+gamma,size(x1));
    
    y1=alpha.*x1+(1-alpha).*x2;
    y2=alpha.*x2+(1-alpha).*x1;
    
for i=1:size(x1,2)
    y1(i)=min(max(y1(i),VarMin),VarMax);
    y2(i)=min(max(y2(i),VarMin),VarMax);
end

    
end