clear;
load data_knn;  % �н� ������ �ε�

X=[C1_Train;C2_Train;C3_Train];
Etrain = 0;

N = size(X,1);

for i=1:N
    x=X(i,:);                   %������ �з� ����
    for j=1:N                   %��� �����Ϳ��� �Ÿ� ���
        d(j,1)=norm(x-X(j,:)); 
    end
    
    [sx,si]=sort(d);            % �Ÿ������� ����
    K=10;                        % K = 5�� ����
    c=zeros(3,1); 
    
    
    for j=1:K                   %�̿��� K�� ������ ���� �����Ͽ� ��ǥ ����
        
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
                        
    [maxv, maxi]=max(c);                % �ִ� ��ǥ���� ���� Ŭ������ �Ҵ�
    if(maxi ~= (floor((i-1)/100)+1))    % ���� Ŭ���� �󺧰� �ٸ���
        Etrain(1,1) = Etrain(1,1)+1;    % ���� �������� ���� ����
    end
end

% ���з��� ���
K
Error_rate = Etrain/N
    
        
