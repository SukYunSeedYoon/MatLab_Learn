clear ;

load data_hw_bayes;

KlassCount=2; % Ŭ������ ��


% Ŭ������ ǥ�� ��� ���
meanArray=[mean(X1);mean(X2)];
S(:,:,1)=cov(X1);
S(:,:,2)=cov(X2);


% Ŭ������ ǥ�� ���л��� ���
smean=(cov(X1)+cov(X2))/2;


% �н� ������ ���� : 200~
trainData=[X1;X2];


% Ŭ���� �������� ��
ArraySize = size(X1,1);


EC1 = 0;
EC2 = 0;
for kIndex=1:KlassCount                                 % Ŭ�������� �з� ����
    X=trainData((kIndex-1)*100+1:kIndex*100,:);         % ù��° �ι��� �ݺ��ϱ� ����
    
    for arrayIndex=1:ArraySize                          % �� �����Ϳ� ���� �з� ���� �̰������� 100��
        
        for kCount=1:KlassCount                         % �Ǻ��Լ��� �� ���
            
            % �Ϲ����� ���л������ ������ ����� �Ǻ� �Լ�
            leftVal = (X(arrayIndex,:)-meanArray(kCount,:));
            rightVal= inv(reshape(S(:,:,kCount),2,2)) * (X(arrayIndex,:)-meanArray(kCount,:))';
            d1(kCount,1) = leftVal * rightVal;
            
        end
        
        % �Ǻ� �Լ� ���� ���� �з�
        %min�� �ּڰ� v�� �ε��� v�� �˷��ݴϴ�
        [min1v, min1i] = min(d1);
    end
end


[EC1, EC2]



