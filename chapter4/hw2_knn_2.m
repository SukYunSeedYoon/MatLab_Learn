
clear;
N = 100;
K = 10;

m1=repmat([0,0], N, 1);
m2=repmat([5,0], N, 1);
m3=repmat([2.5,5], N, 1);

S1= [3 0 ; 0 3];
C1_Train=randn(N, 2) * sqrtm(S1) + m1;
C2_Train=randn(N, 2) * sqrtm(S1) + m2;
C3_Train=randn(N, 2) * sqrtm(S1) + m3;


m4=repmat([0,0], K, 1);
m5=repmat([5,0], K, 1);
m6=repmat([2.5,5], K, 1);


C1_Test=randn(K, 2) * sqrtm(S1) + m4;
C2_Test=randn(K, 2) * sqrtm(S1) + m5;
C3_Test=randn(K, 2) * sqrtm(S1) + m6;


plot(C1_Train(:, 1), C1_Train(:, 2), 'x');
hold on;
plot(C2_Train(:, 1), C2_Train(:, 2), 'x');
hold on;
plot(C3_Train(:, 1), C3_Train(:, 2), 'x');


plot(C1_Test(:, 1), C1_Test(:, 2), 'o');
hold on;
plot(C2_Test(:, 1), C2_Test(:, 2), 'o');
hold on;
plot(C3_Test(:, 1), C3_Test(:, 2), 'o');


