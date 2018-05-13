clear;
load data_knn;  % �н� ������ �ε�

X=[C1_Train;C2_Train;C3_Train];
[x,y]=meshgrid([-5:0.2:10], [-5:0.2:10]);
XY=[x(:), y(:)];

figure(1); 
hold on

plot(C1_Train(:,1), C1_Train(:,2), '*');
plot(C2_Train(:,1), C2_Train(:,2), 'ro');
plot(C3_Train(:,1), C3_Train(:,2), 'kd');

for i=1:size(XY,1)
    xt=XY(i,:);    
    for j=1:size(X,1)      
        d(j,1)=norm(xt-X(j,:)); 
    end
    
    [sx,si]=sort(d);            % �Ÿ������� ����
    K=30;                        % K = 5�� ����
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
    rxy1(i, 1)=maxi;
end

rxy1=reshape(rxy1, size(x));
contour(x,y,rxy1);
axis([-5 10 -5 10]);
grid on
    
        
