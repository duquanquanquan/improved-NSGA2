function LSPF=ELS(PF,VarMin,VarMax,TestNO,t,MaxDT)
    num=numel(PF);
    miu = 0;
    sigmax = 0.5;
    sigmin = 0.05;
    sigmax1 = 1;
    sigmin1 = 0.1;
    sigm = sigmax - (sigmax - sigmin)*t/MaxDT;
    sigm1 = sigmax1 - (sigmax1 - sigmin1)*t/MaxDT;
    sit=[]; 
    mm=0;
    for ii=1:num    
        if rand<sigm1
                gauss = miu + sigm * randn;
                x=PF(ii).Position;
                cx=PF(ii).Cost;
                nVar=numel(x);
                j=randi([1 nVar]);
                dx=gauss*(VarMax-VarMin);
                xnew=x;
                xnew(j)=x(j)+dx;
                if xnew(j)<VarMin
                    xnew(j)=VarMin;
                end
                if xnew(j)>VarMax
                    xnew(j)=VarMax;
                end
                y=xnew;
                cy=MyCost(y,TestNO);
%                 if Dominates1(cy,cx)
                    PF(ii).Position=y;
                    PF(ii).Cost=cy;
%                     mm=501;
                    sit=[sit,ii];
%                 else
%                     mm=mm+1;
%                 end
            end
    end
    LSPF=PF(sit);
end