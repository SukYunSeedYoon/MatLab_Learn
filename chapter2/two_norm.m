N = 25;

% e matrix - 25*2
m1 = repmat([3,5], N, 1);
m2= repmat([5,3], N, 1);

% def  cov  1,1 1,2
S1=[1 1 : 1 2 ];
S2=[1 1 : 1 2];

% randn - gausian - norm dist
% this code is avg = 0, cov normalize
% X1=randn(N, 2);
% X2=randn(N,2);
X1=randn(N, 2);
X2=randn(N,2);
plot(X1(:,1), X1(:,2), '+');
hold on;
plot(X2(:,1), X2(:,2), 'd');