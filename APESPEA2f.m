function PF=APESPEA2f(PF,Ne)
    num=numel(PF);
    N=[1:num];
    LF=[];

    for j=1:num
        tP(j,:)=PF(j).Position;
        tpa(j,:)=PF(j).Cost;
    end
    
    [Ns,C]=size(tpa);
    for i=1:Ns
        for j=i+1:Ns
            E(i,j)=sqrt(sum((tpa(i,:)-tpa(j,:)).^2));
            E(j,i)=E(i,j);
        end
    end
    while Ns>Ne
        SE=[];
        SE=sort(E,2);
        i=1;
        cc=[1:Ns]';
        dd=[];
        while i<Ns
            EC=[];
            EC=SE(cc,i+1);
            [aa,bb]=min(EC);
            dd=find(EC==aa);
            cc=cc(dd);
            if length(cc)==1
                i=Ns+1;
                deleti=cc;
            end
            i=i+1;
        end
        if length(cc)~=1
            deleti=cc(1);
        end
        tP(deleti,:)=[];
        tpa(deleti,:)=[];
        E(deleti,:)=[];
        E(:,deleti)=[];
        Ns=Ns-1;
        nn=numel(PF);
        PF1=PF(1:deleti-1);
        PF2=PF(deleti+1:nn);
        PF=[PF1;PF2];
    end
end% environmental selection