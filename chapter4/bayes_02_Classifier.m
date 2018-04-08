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
        for j=1:3       % ������ �Ǻ��Լ� �� ���
            
            % d1(ù��° �Ǻ��Լ� ����) = (c1 ù��° ������ - c1 ù��° ���) * (c1 ù��° ������ - c1
            % ù��° ���)
            d1(j,1) = (dataSet(i,:)-meanArray(j,:)) * (dataSet(i,:)-meanArray(j,:))';
            d2(j,1) = (dataSet(i,:)-meanArray(j,:)) * inv(smean) * (dataSet(i,:)-meanArray(j,:))';
            
            % d1(ù��° �Ǻ��Լ� ����) = (c1 ù��° ������ - c1 ù��° ���) * (����� ���л� * ������ )
            d3(j,1) = (dataSet(i,:)-meanArray(j,:)) * inv(reshape(S(:,:,j),2,2)) * (dataSet(i,:)-meanArray(j,:))';
        end
        
        
        %min�� �ּڰ� v�� �ε��� v�� �˷��ݴϴ�
        [min1v, min1i] = min(d1);
        
        % �����Լ����� ���� �ּڰ��� Ŭ������ Ÿ���� �ٸ��� ����
        % ����ٰ� �մϴ�
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
   