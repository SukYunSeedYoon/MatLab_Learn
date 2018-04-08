
clear;
N = 100;

m3=repmat([0, 3.5], N, 1);
S3= [2 0 ; 0 1];
X3=randn(N, 2) * sqrtm(S3) + m3;


m2=repmat([3,3], N, 1);
S2= [1 1.6 ; 1.6 4];
X2=randn(N, 2) * sqrtm(S2) + m2;


m1=repmat([0,0], N, 1);
S1= [1 0 ; 0 1];
X1=randn(N, 2) * sqrtm(S1) + m1;



mm1 = mean(X1)
mm2 = mean(X2)
mm3 = mean(X3)


plot(X1(:, 1), X1(:, 2), '.');
hold on;
plot(X2(:, 1), X2(:, 2), 'o');
hold on;
plot(X3(:, 1), X3(:, 2), 'd');

save data4_1 X1 X2 X3

