clc;
clear;
close all;

TestNO=input('press the enter key after inputting the serial number of test problem:');
% Trial=input('input the number of independent runs:');
%% Problem Definition

% CostFunction=@(x) MyCost(x);

[VarMin VarMax nVar]=gscope(TestNO);

VarSize=[1 nVar];

VarRange=[VarMin' VarMax'];
%% NSGA-II Parameters

MaxIt=200;

nPop=50;

pCrossover=0.8;
nCrossover=round(pCrossover*nPop/2)*2;

pMutation=0.2;
nMutation=round(pMutation*nPop);

mu=1/nVar;
pc=0.9;
% mu=0.1;
%% Initialization
tic;
for trial=1:30
empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Rank=[];
empty_individual.CrowdingDistance=[];
empty_individual.DominatedCount=[];
empty_individual.DominationSet=[];

pop=repmat(empty_individual,nPop,1);
% LSPF=repmat(empty_individual,1,1);

for i=1:nPop
    pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
    pop(i).Cost=MyCost(pop(i).Position,TestNO);
end

% Non-dominated Sorting
[pop F]=NonDominatedSorting(pop);

% Calculate Crowding Distances
pop=CalcCrowdingDistance(pop,F);

PF=pop(F{1});
anPop=nPop;
LSPF=pop;

%% NSGA-II Loop

for it=1:MaxIt


%     CRmin=0.1;
%     CRmax=0.4;
%     pm=(Fmax-Fmin)*(MaxIt-it)/MaxIt+Fmin;
%     nMutation=round(pm*nPop);

    Fmax=0.9;
    Fmin=0.4;
    CRmin=0.3;
    CRmax=0.9;
    bestX=pop(1).Position;
    q=(MaxIt-it)/MaxIt;
    F=(Fmax-Fmin)*(MaxIt-it)/MaxIt+Fmin;
    CR=CRmin+(CRmax-CRmin)*it/MaxIt;
    popm=repmat(empty_individual,nMutation,1);

for k=1:nPop
%     i1=BinaryTournamentSelection(pop);
    X(k,:)=pop(k).Position;
end
    U=demutation(X,bestX,F,q,nVar,VarRange,length(popm));
%     U=dCrossover(X,V2,CR);

    for k=1:nMutation 
       popm(k).Position=U(k,:);
       popm(k).Cost=MyCost(U(k,:),TestNO);
    end

    popc=repmat(empty_individual,nCrossover/2,2);
    
    for k=1:nCrossover/2
        
        i1=BinaryTournamentSelection(pop);
        i2=BinaryTournamentSelection(pop);
        
        if i1==i2
            i2=BinaryTournamentSelection(pop);
        end
        
        [popc(k,1).Position popc(k,2).Position]=Crossover2(pop(i1).Position,pop(i2).Position,VarRange);
        
        popc(k,1).Cost=MyCost(popc(k,1).Position,TestNO);
        popc(k,2).Cost=MyCost(popc(k,2).Position,TestNO);
        
    end
    popc=popc(:);
%     
%     popm=repmat(empty_individual,nMutation,1);
%     for k=1:nMutation
%         
%         i=BinaryTournamentSelection(pop);
%         
%         popm(k).Position=Mutate1(pop(k).Position,mu,VarRange);
%         
%         popm(k).Cost=MyCost(popm(k).Position,TestNO);
%         
%     end

    % Merge Pops
    pop=[pop
            popm
                popc
                LSPF];
    
    % Non-dominated Sorting
    [pop F]=NonDominatedSorting(pop);

    % Calculate Crowding Distances
    pop=CalcCrowdingDistance(pop,F);
    
    % Sort Population
    [pop F]=SortPopulation(pop);
       
    PF=pop(F{1}); 
    NE=numel(PF);
    
%     ¶¯Ì¬¾Û¼¯¾àÀë
    if NE>anPop 
        pop=APESPEA2f(PF,anPop);
    else
        pop=pop(1:anPop);
    end

    % Non-dominated Sorting
    [pop F]=NonDominatedSorting(pop);
    
    % Calculate Crowding Distances
    pop=CalcCrowdingDistance(pop,F);
    
    [pop F]=SortPopulation(pop);
    % Plot F1
    PF=pop(F{1}); 
    PFCosts=[PF.Cost];
    
    NF=numel(PF);
%     LSPF=ELS(pop,VarMin,VarMax,TestNO,it,MaxIt);
%     popcc=repmat(empty_individual,nCrossover/2,2);
%     for k=1:nCrossover/2
%         
%         i1=BinaryTournamentSelection(pop);
%         i2=BinaryTournamentSelection(pop);
%         
%         [popcc(k,1).Position popcc(k,2).Position]=Crossover(pop(i1).Position,pop(i2).Position,VarRange);
%         
%         popcc(k,1).Cost=MyCost(popcc(k,1).Position,TestNO);
%         popcc(k,2).Cost=MyCost(popcc(k,2).Position,TestNO);
%         
%     end
%     popcc=popcc(:);
    if NF>=2
    xx=0.1-0.01*it/MaxIt;
%     mm=0.35-0.3*it/MaxIt;
%     mm=1-0.1*it/MaxIt;
    % Mutation
    mm=0.1;
    popmm=repmat(empty_individual,NF,1);
    for k=1:NF
        
%         i=BinaryTournamentSelection(PF);
        
        popmm(k).Position=Mutate(PF(k).Position,mm,xx,VarRange);
        
        popmm(k).Cost=MyCost(popmm(k).Position,TestNO);
        
    end
    
    LSPF=popmm;
    end
%     

%     figure(1);
%     plot(PFCosts(1,:),PFCosts(2,:),'r*');
% %     xlabel('f_1');
% %     ylabel('f_2');
%     pause(0.01)
%     % Show Iteration Information
%     disp(['Iteraion ' num2str(it) ': Number of F1 Members = ' num2str(numel(PF))]);
    disp(sprintf('time: %d   generation: %d ',trial,it));
end

RunTime=toc;

Ob(trial,:)=IG_SP(PFCosts,TestNO);

end

    figure(1);
    plot(PFCosts(1,:),PFCosts(2,:),'r*');
    xlabel('D-NSGA-II-ELS');
%     ylabel('f_2');
    pause(0.01)
    % Show Iteration Information
    disp(['Iteraion ' num2str(it) ': Number of F1 Members = ' num2str(numel(PF))]);
