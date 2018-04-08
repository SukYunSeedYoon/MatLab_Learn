clear;

N = 100;
K = 50;


m1=repmat([0,0], N, 1);
S1= [1 0 ; 0 1];
X1=randn(N, 2) * sqrtm(S1) + m1;

m2=repmat([10,0], N, 1);
S2= [5 0 ; 0 5];
X2=randn(N, 2) * sqrtm(S2) + m2;

m3=repmat([0, 10], K, 1);
S3= [1 0 ; 0 5];
X3=randn(K, 2) * sqrtm(S3) + m3;

m4=repmat([10, 10], K, 1);
S4= [1 1 ; 1 2];
X4=randn(K, 2) * sqrtm(S4) + m4;



plot(X1(:, 1), X1(:, 2), '.');
hold on;
plot(X2(:, 1), X2(:, 2), 'o');
hold on;
plot(X3(:, 1), X3(:, 2), 'd');
hold on;
plot(X4(:, 1), X4(:, 2), '*');


save data1_1 X1 X2 X3 X4

