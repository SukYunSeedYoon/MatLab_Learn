clear;

KlassCount=3;
%load data4_1.mat 
load dataCh4_7


% avg Mean for per class
meanArray=[ mean(X1);mean(X2);mean(X3)]; 

S(:,:,1) = cov(X1);
S(:,:,2) = cov(X2);
S(:,:,3) = cov(X3);

smean=(cov(X1) + cov(X2) + cov(X3)) / 3 ;
trainData=[X1;X2;X3];   

trainErr=zeros(3,1);
DataArrCount = size(X1, 1);

for klassIndex=1:KlassCount
    dataSet = trainData((klassIndex-1) * DataArrCount+1:klassIndex*DataArrCount,:);
    for i=1:DataArrCount
        for j=1:3       % 세개의 판별함수 값 계산
            
            % d1(첫번째 판별함수 저장) = (c1 첫번째 데이터 - c1 첫번째 평균) * (c1 첫번째 데이터 - c1
            % 첫번째 평균)
            d1(j,1) = (dataSet(i,:)-meanArray(j,:)) * (dataSet(i,:)-meanArray(j,:))';
            d2(j,1) = (dataSet(i,:)-meanArray(j,:)) * inv(smean) * (dataSet(i,:)-meanArray(j,:))';
            
            % d1(첫번째 판별함수 저장) = (c1 첫번째 데이터 - c1 첫번째 평균) * (재계산된 공분산 * 데이터 )
            d3(j,1) = (dataSet(i,:)-meanArray(j,:)) * inv(reshape(S(:,:,j),2,2)) * (dataSet(i,:)-meanArray(j,:))';
        end
        
        
        %min은 최솟값 v와 인덱스 v를 알려줍니다
        [min1v, min1i] = min(d1);
        
        % 결정함수에서 나온 최솟값과 클래스의 타입이 다르면 오류
        % 벗어낫다고 합니다
        if(min1i~=klassIndex) 
            trainErr(1,1) = trainErr(1,1)+1; 
        end
        
        
        [min2v, min2i] = min(d2);
        if(min2i~=klassIndex) 
            trainErr(2,1) = trainErr(2,1)+1; 
        end
        
        [min3v, min3i] = min(d3);
        if(min3i~=klassIndex) 
            trainErr(3,1) = trainErr(3,1)+1; 
        end
        
    end
end





Error_rate = trainErr/(DataArrCount*KlassCount);
   