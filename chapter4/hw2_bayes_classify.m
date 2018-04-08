clear ;

load data_hw_bayes;

KlassCount=2; % 클래스의 수


% 클래스의 표준 평균 계산
meanArray=[mean(X1);mean(X2)];
S(:,:,1)=cov(X1);
S(:,:,2)=cov(X2);


% 클래스별 표준 공분산의 평균
smean=(cov(X1)+cov(X2))/2;


% 학습 데이터 구성 : 200~
trainData=[X1;X2];


% 클래스 데이터의 수
ArraySize = size(X1,1);


EC1 = 0;
EC2 = 0;
for kIndex=1:KlassCount                                 % 클래스별로 분류 시작
    X=trainData((kIndex-1)*100+1:kIndex*100,:);         % 첫번째 두번재 반복하기 위해
    
    for arrayIndex=1:ArraySize                          % 각 데이터에 대해 분류 시작 이곳에서는 100개
        
        for kCount=1:KlassCount                         % 판별함수의 값 계산
            
            % 일반적인 공분산행렬을 가정한 경우의 판별 함수
            leftVal = (X(arrayIndex,:)-meanArray(kCount,:));
            rightVal= inv(reshape(S(:,:,kCount),2,2)) * (X(arrayIndex,:)-meanArray(kCount,:))';
            d1(kCount,1) = leftVal * rightVal;
            
        end
        
        % 판별 함수 값에 따라 분류
        %min은 최솟값 v와 인덱스 v를 알려줍니다
        [min1v, min1i] = min(d1);
    end
end


[EC1, EC2]



