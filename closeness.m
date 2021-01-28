n=10
X=rand(n,n)
Z=randomnetworkfunction(X,n)
D=zeros(n,n)+n 

for f=1:n 
    Q=zeros(n,1) 
    p=1 
    s=1 
    MR=zeros(n,1)
    [Q,p]=addtoqueue(Q,p,f) 
    MR(f,1)=1 
    D(f,f)=0 
    
    while s<p 
        [s,r]=takefromqueue(Q,s) 
        for i=1:n 
            if Z(i,r)==1 
                if MR(i,1)==0 
                    [Q,p]=addtoqueue(Q,p,i) 
                    MR(i,1)=1 
                    D(i,f)=D(r,f)+1 
                end
            end
        end
    end
                
    ZZ = sum(D,1).^-1 
    ZC=centrality(graph(Z),'closeness') 
end
