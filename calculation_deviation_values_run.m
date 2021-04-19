clc
clear all

M1=importdata('survivor_data2.csv');
M2=importdata('18_month_nonsurvivor.csv');
n1=length(M1);
n2=length(M2);
V2='Encephalopathy'
V3='Albumin'
V4='Bilirubin'
V5='PT'
V6='Ammonia'
namelist=[V2,V3,V4,V5,V6];
TA=M1(:,1)
TB=M2(:,1)

for nA=2:6
    for nB=nA+1:6
        nameA=namelist(nA-1)
        nameB=namelist(nB-1)
        [T1,T2,T3,T4]=new_deviation_function(M1,M2,n1,n2,nA,nB,nameA,nameB)
        TA=[TA,T3(:,2)]
        TB=[TB,T4(:,2)]
    end
end


