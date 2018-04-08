
% 25개의 �이�� 만들겠음
N=25

% m �균25*2개로 만들겠음

% 메트릊�복사�서 만들겠음
m1=repmat([3,5], N, 1);
m2=repmat([5, 3], N, 1);

% 공분�을 �렇겘행
s1=[1 1; 1 2];
s2=[1 1; 1 2];



% n * 2�이�성, 만들긜작
% �렇�만들멉균� 0�고 공분�� �위�렬
% �균��긄해�균�해주고
% 공분�을 조정�기 �해�는 �렬�sqrtm�수�곱해주면
% 가�시분포�균조정�음
% X1 == C1 �이

X1=randn(N,2)* sqrtm(s1)+m1;
X2=randn(N,2)*sqrtm(s2)+m2;


% 보여�
% �나x1 �이�는 �의값과 �에 값이 �음(2 차원)(X(n, n))
% (X1(:,1))
plot(X1(:,1), X1(:,2), '+');
hold on;

plot(X2(:,1), X2(:,2), 'd');
save data2_1, X1, X2;
