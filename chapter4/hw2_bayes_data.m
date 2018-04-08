
clear;
N = 100;

m1=repmat([0,0], N, 1);
S1= [3 0 ; 0 5];
X1=randn(N, 2) * sqrtm(S1) + m1;

m2=repmat([5,5], N, 1);
S2= [3 0 ; 0 2];
X2=randn(N, 2) * sqrtm(S2) + m2;


plot(X1(:, 1), X1(:, 2), '.');
hold on;
plot(X2(:, 1), X2(:, 2), 'o');



save data_hw_bayes X1 X2

