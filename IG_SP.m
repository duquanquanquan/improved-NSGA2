function Ob=IG_SP(A,NO)
%主程序
% clear all;
% clc;


%%%%%%%%%B是目标值，Z是穷举得到的
%%%%ZDT1  ZDT2   ZDT3    
%%%% Binh2  Srinivas   TANAKA  CTP1

load solution-QJ-ZDT1.txt         %%%%%%%%%%%%%需修改
load solution-QJ-ZDT2.txt 
load solution-QJ-ZDT3.txt 
load solution-QJ-Binh2.txt 
load solution-QJ-Srinivas.txt 
load solution-QJ-Tanaka.txt 
load solution-QJ-CTP1.txt
load solution-QJ-UF2.txt


A=A';
switch NO
    case 1
        z=solution_QJ_ZDT1;
        [ww,ee]=size(z);
        [t y]=size(A);
        for i=1:t 
            for j=1:ww      
                m(j)=norm(A(i,:)-z(j,:));    
            end
            dd(i)=min(m);
        end        
        sum=0;
        for k=1:t    
            sum=sum+dd(k);
        end        
        IGD=(sqrt(sum))/t;
%   save solution-CTP1-MOEAD-IGD.txt IGD1 -ASCII  
        sa=A(:,1);
        [Q,SY]=sort(sa,1);
        BP=A(SY,:);
        sb=z(:,1);
        [q,sy]=sort(sb,1);
        zp=z(sy,:);
        dl=norm(zp(1,:)-BP(1,:));
        df=norm(zp(size(zp,1),:)-BP(size(BP,1),:));
        ds=0;
        for i=1:(size(BP,1)-1)  
            d(i)=norm(BP(i+1,:)-BP(i,:));  
            ds=ds+d(i);
        end
        dm=ds/size(BP,1) ; 
        dp=0;   
        for i=1:(size(BP,1)-1)    
            dp= dp+abs(d(i)-dm);
        end
        SPREAD=(df+dl+dp)/(df+dl+ds);
        
        Ob=[IGD,SPREAD];
 
    case 2
        z=solution_QJ_ZDT2;
        [ww,ee]=size(z);
        [t y]=size(A);
        for i=1:t 
            for j=1:ww      
                m(j)=norm(A(i,:)-z(j,:));    
            end
            dd(i)=min(m);
        end        
        sum=0;
        for k=1:t    
            sum=sum+dd(k);
        end        
        IGD=(sqrt(sum))/t;
%   save solution-CTP1-MOEAD-IGD.txt IGD1 -ASCII  
        sa=A(:,1);
        [Q,SY]=sort(sa,1);
        BP=A(SY,:);
        sb=z(:,1);
        [q,sy]=sort(sb,1);
        zp=z(sy,:);
        dl=norm(zp(1,:)-BP(1,:));
        df=norm(zp(size(zp,1),:)-BP(size(BP,1),:));
        ds=0;
        for i=1:(size(BP,1)-1)  
            d(i)=norm(BP(i+1,:)-BP(i,:));  
            ds=ds+d(i);
        end
        dm=ds/size(BP,1) ; 
        dp=0;   
        for i=1:(size(BP,1)-1)    
            dp= dp+abs(d(i)-dm);
        end
        SPREAD=(df+dl+dp)/(df+dl+ds);
        
        Ob=[IGD,SPREAD];
        
    case 3            
        z=solution_QJ_ZDT3;
        [ww,ee]=size(z);
        [t y]=size(A);
        for i=1:t 
            for j=1:ww      
                m(j)=norm(A(i,:)-z(j,:));    
            end
            dd(i)=min(m);
        end        
        sum=0;
        for k=1:t    
            sum=sum+dd(k);
        end        
        IGD=(sqrt(sum))/t;
%   save solution-CTP1-MOEAD-IGD.txt IGD1 -ASCII  
        sa=A(:,1);
        [Q,SY]=sort(sa,1);
        BP=A(SY,:);
        sb=z(:,1);
        [q,sy]=sort(sb,1);
        zp=z(sy,:);
        dl=norm(zp(1,:)-BP(1,:));
        df=norm(zp(size(zp,1),:)-BP(size(BP,1),:));
        ds=0;
        for i=1:(size(BP,1)-1)  
            d(i)=norm(BP(i+1,:)-BP(i,:));  
            ds=ds+d(i);
        end
        dm=ds/size(BP,1) ; 
        dp=0;   
        for i=1:(size(BP,1)-1)    
            dp= dp+abs(d(i)-dm);
        end
        SPREAD=(df+dl+dp)/(df+dl+ds);
        
        Ob=[IGD,SPREAD];
        
    case 4
        z=solution_QJ_Binh2;
        [ww,ee]=size(z);
        [t y]=size(A);
        for i=1:t 
            for j=1:ww      
                m(j)=norm(A(i,:)-z(j,:));    
            end
            dd(i)=min(m);
        end        
        sum=0;
        for k=1:t    
            sum=sum+dd(k);
        end        
        IGD=(sqrt(sum))/t;
%   save solution-CTP1-MOEAD-IGD.txt IGD1 -ASCII  
        sa=A(:,1);
        [Q,SY]=sort(sa,1);
        BP=A(SY,:);
        sb=z(:,1);
        [q,sy]=sort(sb,1);
        zp=z(sy,:);
        dl=norm(zp(1,:)-BP(1,:));
        df=norm(zp(size(zp,1),:)-BP(size(BP,1),:));
        ds=0;
        for i=1:(size(BP,1)-1)  
            d(i)=norm(BP(i+1,:)-BP(i,:));  
            ds=ds+d(i);
        end
        dm=ds/size(BP,1) ; 
        dp=0;   
        for i=1:(size(BP,1)-1)    
            dp= dp+abs(d(i)-dm);
        end
        SPREAD=(df+dl+dp)/(df+dl+ds);
        
        Ob=[IGD,SPREAD];
        
    case 5
        z=solution_QJ_Srinivas;
        [ww,ee]=size(z);
        [t y]=size(A);
        for i=1:t 
            for j=1:ww      
                m(j)=norm(A(i,:)-z(j,:));    
            end
            dd(i)=min(m);
        end        
        sum=0;
        for k=1:t    
            sum=sum+dd(k);
        end        
        IGD=(sqrt(sum))/t;
%   save solution-CTP1-MOEAD-IGD.txt IGD1 -ASCII  
        sa=A(:,1);
        [Q,SY]=sort(sa,1);
        BP=A(SY,:);
        sb=z(:,1);
        [q,sy]=sort(sb,1);
        zp=z(sy,:);
        dl=norm(zp(1,:)-BP(1,:));
        df=norm(zp(size(zp,1),:)-BP(size(BP,1),:));
        ds=0;
        for i=1:(size(BP,1)-1)  
            d(i)=norm(BP(i+1,:)-BP(i,:));  
            ds=ds+d(i);
        end
        dm=ds/size(BP,1) ; 
        dp=0;   
        for i=1:(size(BP,1)-1)    
            dp= dp+abs(d(i)-dm);
        end
        SPREAD=(df+dl+dp)/(df+dl+ds);
        
        Ob=[IGD,SPREAD];
        
    case 6
        z=solution_QJ_Tanaka;
        [ww,ee]=size(z);
        [t y]=size(A);
        for i=1:t 
            for j=1:ww      
                m(j)=norm(A(i,:)-z(j,:));    
            end
            dd(i)=min(m);
        end        
        sum=0;
        for k=1:t    
            sum=sum+dd(k);
        end        
        IGD=(sqrt(sum))/t;
%   save solution-CTP1-MOEAD-IGD.txt IGD1 -ASCII  
        sa=A(:,1);
        [Q,SY]=sort(sa,1);
        BP=A(SY,:);
        sb=z(:,1);
        [q,sy]=sort(sb,1);
        zp=z(sy,:);
        dl=norm(zp(1,:)-BP(1,:));
        df=norm(zp(size(zp,1),:)-BP(size(BP,1),:));
        ds=0;
        for i=1:(size(BP,1)-1)  
            d(i)=norm(BP(i+1,:)-BP(i,:));  
            ds=ds+d(i);
        end
        dm=ds/size(BP,1) ; 
        dp=0;   
        for i=1:(size(BP,1)-1)    
            dp= dp+abs(d(i)-dm);
        end
        SPREAD=(df+dl+dp)/(df+dl+ds);
        
        Ob=[IGD,SPREAD];
        
    case 7
        z=solution_QJ_CTP1;
        [ww,ee]=size(z);
        [t y]=size(A);
        for i=1:t 
            for j=1:ww      
                m(j)=norm(A(i,:)-z(j,:));    
            end
            dd(i)=min(m);
        end        
        sum=0;
        for k=1:t    
            sum=sum+dd(k);
        end        
        IGD=(sqrt(sum))/t;
%   save solution-CTP1-MOEAD-IGD.txt IGD1 -ASCII  
        sa=A(:,1);
        [Q,SY]=sort(sa,1);
        BP=A(SY,:);
        sb=z(:,1);
        [q,sy]=sort(sb,1);
        zp=z(sy,:);
        dl=norm(zp(1,:)-BP(1,:));
        df=norm(zp(size(zp,1),:)-BP(size(BP,1),:));
        ds=0;
        for i=1:(size(BP,1)-1)  
            d(i)=norm(BP(i+1,:)-BP(i,:));  
            ds=ds+d(i);
        end
        dm=ds/size(BP,1) ; 
        dp=0;   
        for i=1:(size(BP,1)-1)    
            dp= dp+abs(d(i)-dm);
        end
        SPREAD=(df+dl+dp)/(df+dl+ds);
        
        Ob=[IGD,SPREAD];
        
        case 8
        z=solution_QJ_UF2;
        [ww,ee]=size(z);
        [t y]=size(A);
        for i=1:t 
            for j=1:ww      
                m(j)=norm(A(i,:)-z(j,:));    
            end
            dd(i)=min(m);
        end        
        sum=0;
        for k=1:t    
            sum=sum+dd(k);
        end        
        IGD=(sqrt(sum))/t;
%   save solution-CTP1-MOEAD-IGD.txt IGD1 -ASCII  
        sa=A(:,1);
        [Q,SY]=sort(sa,1);
        BP=A(SY,:);
        sb=z(:,1);
        [q,sy]=sort(sb,1);
        zp=z(sy,:);
        dl=norm(zp(1,:)-BP(1,:));
        df=norm(zp(size(zp,1),:)-BP(size(BP,1),:));
        ds=0;
        for i=1:(size(BP,1)-1)  
            d(i)=norm(BP(i+1,:)-BP(i,:));  
            ds=ds+d(i);
        end
        dm=ds/size(BP,1) ; 
        dp=0;   
        for i=1:(size(BP,1)-1)    
            dp= dp+abs(d(i)-dm);
        end
        SPREAD=(df+dl+dp)/(df+dl+ds);
        
        Ob=[IGD,SPREAD];
end
end