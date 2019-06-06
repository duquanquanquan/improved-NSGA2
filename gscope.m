function [VarMin,VarMax,nVar]=gscope(NO)

switch NO
    
    case 1 %ZDT1
%         VarMin=0;  VarMax=1;  nVar=30;
        nVar=30; VarMin=zeros(1,nVar); VarMax=ones(1,nVar);
        
    case 2 %ZDT2
%         VarMin=0;  VarMax=1;  nVar=30;
        nVar=30; VarMin=zeros(1,nVar); VarMax=ones(1,nVar);
        
    case 3 %ZDT3
%         VarMin=0;  VarMax=1;  nVar=30;
        nVar=30; VarMin=zeros(1,nVar); VarMax=ones(1,nVar);
    
    case 4 %Binh2
%         VarMin=-15;  VarMax=30;  nVar=2;
        nVar=2; VarMin=-15*ones(1,nVar); VarMax=30*ones(1,nVar);
        
    case 5 %Srinivas
%         VarMin=-20;  VarMax=20;  nVar=2;
        nVar=2; VarMin=-20*ones(1,nVar); VarMax=20*ones(1,nVar);
        
    case 6 %TANAKA
%         VarMin=0;  VarMax=pi;  nVar=2;
        nVar=2; VarMin=zeros(1,nVar); VarMax=pi*ones(1,nVar);
        
    case 7 %CTP1
%         VarMin=0;  VarMax=1;  nVar=2;
        nVar=2; VarMin=zeros(1,nVar); VarMax=ones(1,nVar);
        
    case 8 %%%UF2
        nVar=10; VarMin=[0,zeros(1,nVar-1)-1]; VarMax=ones(1,nVar);  
                
end
end