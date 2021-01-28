n=10
X=rand(n,n);

X=randomnetworkfunction(X,n);
names={'A','B','C','D','E','F','G','H','I','J'}
G=graph(X,names);
plot(G)

Z=sum(X);
NC=sum(Z)/2; %how many connections in the network
TC=(n*(n-1))/2; %total number of possible connections
DOC=NC/TC %degree of connectivity

for i=1:10
    DC(i,1)=sum(X(:,i))%average degree of connectivity of a node
end

CC=centrality(G,'closeness'); %closeness function
BC=centrality(G,'betweenness'); %betweenness function

G.Nodes.Degree_of_connectivity=DC
G.Nodes.Closeness = CC;
G.Nodes.Betweenness = BC;
G.Nodes %table
