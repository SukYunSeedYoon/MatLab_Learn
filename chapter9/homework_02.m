% PCA 분석

clear;
clf;

load homework_init

figure(1); % 사영된 데이터를 2차원 공간으로 환원하여 표시
plot( X2(:,1), X2(:,2), 'ro');
hold on;
plot( X1(:,1), X1(:,2), '*');
axis([-10 10 -5 10]);

%==================================================
% PCA에 의한 분석
X=[X1;X2];

% 평균과 공분산 계산
M=mean(X);
S=cov(X);

% 고유치 분석(U : 고유 벡터 행렬, D: 고유치 행렬)
[V,D]=eig(S);

% 첫번째 주성분 벡터 계산과 공간에 표시
w1=V(:,2);
figure(1);
line( [0 w1(1)*D(2,2)] + M(1),[0 w1(2)*D(2,2)]+ M(2));

% 첫번재 주성분 백터 사영
YX1=w1'*X1';YX2=w1'*X2';
% 사영된 데이터를 2차원 공간으로 환원
pYX1=w1*YX1;pYX2=w1*YX2;

figure(2);
plot(pYX1(1,:), pYX1(2,:)+M(2), '*');
hold on axis([-10 10 -5 10]);
plot(pYX2(1,:), pYX2(2,:)+M(2), 'ro');

%==================================================
% LDA에 의한 분석
m1=mean(X1);m2=mean(X2);

% whtiin scatter 계산
Sw=N*cov(X1)+N*cov(X2);

% between scatter 계산
Sb=(m1-m2)' * (m1-m2);

% 고유치분석
[V,D]=eig(Sb*inv(Sw)); %#ok<MINV>
w=V(:,2); % 찾아진 벡터
figure(1); % 백터를 공간에 표시
line([0 w(1)*-8]+M(1), [0 w(2)*-8]+M(2));

% 백터 w 방향으로 사영
YX1=w'*X1'; YX2=w'*X2';

% 사영된 데이터를 2차원 공간으로 환원
pYX1=w*YX1; pYX2=w*YX2;

figure(2);
plot(pYX1(1,:)+M(1), pYX1(2,:), '*');
plot(pYX2(1,:)+M(1), pYX2(2,:), 'ro');







