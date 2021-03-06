clear ;

load data_hw_bayes;

K=2; % 클래스의 수


% 클래스의 표준 평균 계산
M=[mean(X1);mean(X2)];
S(:,:,1)=cov(X1);
S(:,:,2)=cov(X2);


% 클래스별 표준 공분산의 평균
smean=(cov(X1)+cov(X2))/2;


% 학습 데이터 구성 : 200~
trainData=[X1;X2];


% 클래스 데이터의 수
N = size(X1,1);



for k=1:K                                 % 클래스별로 분류 시작
    X=trainData((k-1)*100+1:k*100,:);         % 첫번째 두번재 반복하기 위해
    
    for i=1:N                          % 각 데이터에 대해 분류 시작 이곳에서는 100개
        
        for j=1:K                         % 판별함수의 값 계산
            
            % 일반적인 공분산행렬을 가정한 경우의 판별 함수
            %leftVal = (X(arrayIndex,:)-M(kCount,:));
            %rightVal= inv(reshape(S(:,:,kCount),2,2)) * (X(arrayIndex,:)-M(kCount,:))';
            %d1(kCount,1) = leftVal * rightVal;
            d1(j,i) = (X(i,:)-M(j,:)) * inv(reshape( S(:,:,j),2,2)) * (X(i,:)-M(j,:))';
            
        end
        
        % 판별 함수 값에 따라 분류
        %min은 최솟값 v와 인덱스 v를 알려줍니다
        [min1v, min1i] = min(d1);
    end
end

for k=1:K                                 % 클래스별로 분류 시작
    X=trainData((k-1)*100+1:k*100,:);         % 첫번째 두번재 반복하기 위해
    
    for i=1:N                          % 각 데이터에 대해 분류 시작 이곳에서는 100개
        
        for j=1:K                         % 판별함수의 값 계산
            
            % 일반적인 공분산행렬을 가정한 경우의 판별 함수
            %leftVal = (X(arrayIndex,:)-M(kCount,:));
            %rightVal= inv(reshape(S(:,:,kCount),2,2)) * (X(arrayIndex,:)-M(kCount,:))';
            %d1(kCount,1) = leftVal * rightVal;
            d1(j,i) = (X(i,:)-M(j,:)) * inv(reshape( S(:,:,j),2,2)) * (X(i,:)-M(j,:))';
            
        end
        
        % 판별 함수 값에 따라 분류
        %min은 최솟값 v와 인덱스 v를 알려줍니다
        [min1v, min1i] = min(d1);
    end
end

% x= [1,1] 예시
T = [1 1];
for j=1:K
    d2(j,1) = (T(1,:)-M(j,:)) * inv(reshape( S(:,:,j),2,2)) * (T(1,:)-M(j,:))';
end

[min2v, min2i] = min(d2);

classify_res = min2i










