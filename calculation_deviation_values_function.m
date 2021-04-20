function[T1,T2,T3,T4]=new_deviation_function(M1,M2,n1,n2,nA,nB,nameA,nameB)
ID_ORIS=M1(:,1)
ID_ORINS=M2(:,1)

for i=1:n1
    if isnan(M1(i,nA))
        M1(i,nB)=NaN;
        M1(i,1)=NaN;
    else    
    end
end

for i=1:n1
    if isnan(M1(i,nB))
        M1(i,nA)=NaN;
        M1(i,1)=NaN;
    else   
    end
end

ID_SI=M1(:,1);
A1=M1(:,nA); A1(A1 ~= A1)=[];
B1=M1(:,nB); B1(B1 ~= B1)=[];
ID_S=M1(:,1); ID_S(ID_S ~=ID_S)=[];

for i=1:n2
    if isnan(M2(i,nA))
        M2(i,nB)=NaN;
        M2(i,1)=NaN;
    else   
    end
end

for i=1:n2
    if isnan(M2(i,nB))
        M2(i,nA)=NaN;
        M2(i,1)=NaN;
    else   
    end
end

ID_NSI=M2(:,1);
C1=M2(:,nA); C1(C1 ~= C1)=[];
D1=M2(:,nB); D1(D1 ~= D1)=[];
ID_NS=M2(:,1); ID_NS(ID_NS ~= ID_NS)=[]

format long
figure(1)
scatter(A1,B1)
hold on
xlabel(nameA)
ylabel(nameB)
grid on
A2=[ones(length(A1),1) A1];
b1=A2\B1;
BCalc1=A2*b1;
plot(A1,BCalc1,'--')
legend('Data','slope&Intercept','Location','best')

format long
figure(2)
scatter(B1,A1)
hold on
xlabel(nameB)
ylabel(nameA)
grid on
B2=[ones(length(B1),1) B1];
b2=B2\A1;
ACalc1=B2*b2;
plot(B1,ACalc1,'--')
legend('Data','slope&Intercept','Location','best')

m1=length(A1);
m2=length(C1);

for i=1:m1
    DS1(i,1)=BCalc1(i,1)-B1(i,1);
    DS1(i,1)=sqrt(DS1(i,1)^2);
    DS2(i,1)=ACalc1(i,1)-A1(i,1);
    DS2(i,1)=sqrt(DS2(i,1)^2);
end

for i=1:m2
    DNS1(i,1)=(C1(i,1)*b1(2,1)+b1(1,1))-D1(i,1);
    DNS1(i,1)=sqrt(DNS1(i,1)^2);
    DNS2(i,1)=(D1(i,1)*b2(2,1)+b1(1,1))-C1(i,1);
    DNS2(i,1)=sqrt(DNS2(i,1)^2);
end

for i=1:m1
    DS(i,1)=(DS1(i,1)*DS2(i,1))/sqrt(DS1(i,1)^2+DS2(i,1)^2)
end

for i=1:m2
    DNS(i,1)=(DNS1(i,1)*DNS2(i,1))/sqrt(DNS1(i,1)^2+DNS2(i,1)^2)
end
    
T1=table(ID_S,DS1,DS2,DS)
T2=table(ID_NS,DNS1,DNS2,DNS)
T3=[]
T4=[]

for i=1:length(ID_ORIS)
    id = ID_ORIS(i,1)
    inda = find(ID_S==id)
    if length(inda)>0 
        ind = inda(1)
        T3 = [T3;id,DS(ind)]
    else
        T3 = [T3;id,NaN]
    end
end

for i=1:length(ID_ORINS)
    id=ID_ORINS(i,1)
    inda = find(ID_NS==id)
    if length(inda)>0
        ind=inda(1)
        T4 = [T4;id,DNS(ind)]
    else
        T4 = [T4;id,NaN]
    end
end

end




