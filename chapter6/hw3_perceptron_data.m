
clear;
% 10개의 데이터 생성
NumD=10;

% 0, 0  4/2 평균
% 30 03 rhdqnstks
m1=repmat([0,0], NumD, 1);
m2=repmat([4,2], NumD, 1);

S = [3 0 ; 0 3];

train_c1 = randn(NumD, 2) * sqrtm(S) + m1;
train_c2 = randn(NumD, 2) * sqrtm(S) + m2;

% 합
train = [train_c1; train_c2];
train_out(1:NumD, 1)=zeros(NumD,1);
train_out(1+NumD: 2*NumD,1) = zeros(NumD,1)+1;


 

save hw3_data train train_out NumD
