clc
clear all
close all

S=importdata('survivor data.csv');
NS=importdata('non-survivor data.csv');

[R1,P1]=corrcoef(S,'Rows','pairwise');
[R2,P2]=corrcoef(NS,'Rows','pairwise');

ss=size(S); n=ss(1,2);
 
BF=0.05/(n*(n-1)/2); 

for i=1:n
    for j=1:n
        if P1(i,j)>BF 
            W1(i,j)=0;
        else
            W1(i,j)=R1(i,j);
        end
    end
end

for k=1:n
    for l=1:n
        if P2(i,j)> BF % p-value after Bonferroni correction
            W2(i,j)=0;
        else
            W2(i,j)=R2(i,j);
        end
    end
end

G1=graph(W1,{'Encephalopathy','Albumin','Bilirubin','PT','Creatinine','Ammonia','Na','Hb','CRP'})
G2=graph(W2,{'Encephalopathy','Albumin','Bilirubin','PT','Creatinine','Ammonia','Na','Hb','CRP'})

subplot(1,2,1)  
plot(G1,'Layout','circle','EdgeLabel',G1.Edges.Weight, 'LineWidth',2, 'MarkerSize', 5, 'NodeColor', 'r')
title('Survivors') 
pbaspect([1 1 1]) 

subplot(1,2,2) 
plot(G2,'Layout','circle','EdgeLabel',G2.Edges.Weight, 'LineWidth',2, 'MarkerSize', 5, 'NodeColor', 'r')
title('Non-Survivors') 
pbaspect([1 1 1]) 
