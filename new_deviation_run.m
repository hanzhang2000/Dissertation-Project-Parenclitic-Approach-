clc
clear all

M1=importdata('survivor_data2.csv');
M2=importdata('non_survivor_data2.csv');
n1=length(M1);
n2=length(M2);
V2='Encephalopathy'
V3='Albumin'
V4='Bilirubin'
V5='PT'
V6='Ammonia'
%namelist=[V1,V2,V3,V4,V5];
nA=4;
nB=5;
nameA=V4;
nameB=V5;
[T1,T2]=new_deviation_function(M1,M2,n1,n2,nA,nB,nameA,nameB)