function V=demutation(X,bestX,F,q,n,VarRange,popm)
[NP,y]=size(X);
VarRange=VarRange';
    VarMin=min(VarRange);
    VarMax=max(VarRange);
for i=1:popm%nCrossover/2 个体
  nrandI=2;%产生两个变量r1,r2
    r=randi([1,NP],1,nrandI);%在1到个体数之间产生1*2矩阵如3 4
     for j=1:nrandI
    equalr(j)=sum(r==r(j));%相加，看是1还是2,1个相等是1，两个相等是2
    end
    equali=sum(r==i);%看是1还是0，相等为1，不相等为0
    equalval=sum(equalr)+equali;
    while(equalval>nrandI)%只有2+0才可以不继续循环
        r=randi([1,NP],1,nrandI);
        for j=1:nrandI
        equalr(j)=sum(r==r(j));
        end
        equali=sum(r==i);
        equalval=sum(equalr)+equali;
    end
     V(i,:)=(1-q)*bestX+q*X(i,:)+F*(X(r(1),:)-X(r(2),:));
     for j=1:n%%%%%%
     V(i,j)=min(max( V(i,j),VarMin(j)),VarMax(j));
     end
end