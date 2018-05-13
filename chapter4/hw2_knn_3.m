clear;
load data_knn;  % 학습 데이터 로드

X=[C1_Train;C2_Train;C3_Train];
Etrain = 0;

N = size(X,1);

for i=1:N
    x=X(i,:);                   %데이터 분류 시작
    for j=1:N                   %모든 데이터와의 거리 계산
        d(j,1)=norm(x-X(j,:)); 
    end
    
    [sx,si]=sort(d);            % 거리순으로 정렬
    K=10;                        % K = 5로 정함
    c=zeros(3,1); 
    
    
    for j=1:K                   %이웃한 K개 데이터 라벨을 점검하여 투표 수행
        
        if(si(j) <= 100)        % C1
            c(1)=c(1)+1;
        end
        
                                % C2
        if(si(j) >100 && (si(j)<=200))
            c(2)=c(2)+1;
        end
        
        if(si(j) >200 )         % C3
            c(3)=c(3)+1;
        end
        
        
    end
                        
    [maxv, maxi]=max(c);                % 최대 투표수를 받은 클래스로 할당
    if(maxi ~= (floor((i-1)/100)+1))    % 원래 클래스 라벨과 다르면
        Etrain(1,1) = Etrain(1,1)+1;    % 오류 데이터의 개수 증가
    end
end

% 오분류율 출력
K
Error_rate = Etrain/N
    
        
