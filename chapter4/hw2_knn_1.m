
clear;
N = 100;

m1=repmat([0,0], N, 1);
m2=repmat([5,0], N, 1);
m3=repmat([2.5,5], N, 1);

S1= [3 0 ; 0 3];
C1_Train=randn(N, 2) * sqrtm(S1) + m1;
C2_Train=randn(N, 2) * sqrtm(S1) + m2;
C3_Train=randn(N, 2) * sqrtm(S1) + m3;


plot(C1_Train(:, 1), C1_Train(:, 2), '*');
hold on;
plot(C2_Train(:, 1), C2_Train(:, 2), 'ro');
hold on;
plot(C3_Train(:, 1), C3_Train(:, 2), 'kd');




save data_knn C1_Train C2_Train C3_Train

