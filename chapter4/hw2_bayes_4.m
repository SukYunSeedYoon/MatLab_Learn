clear ;

load data_hw_bayes;

K=2; % Ŭ������ ��


% Ŭ������ ǥ�� ��� ���
M=[mean(X1);mean(X2)];
S(:,:,1)=cov(X1);
S(:,:,2)=cov(X2);


% Ŭ������ ǥ�� ���л��� ���
smean=(cov(X1)+cov(X2))/2;

[x,y]=meshgrid([-6:0.2:12],[-8:0.2:12]);
XY=[x(:), y(:)];



% �н� ������ ���� : 200~
trainData=[X1;X2];


for i=1:size(XY,1)
    for j=1:K
        % �Ϲ����� ���л������ ������ ����� �Ǻ� �Լ�
        d1(j,1)=(XY(i,:) - M(j,:))*inv(reshape(S(:,:,j),2,2))*(XY(i,:)-M(j,:))';
    end
        
    % �Ǻ� �Լ� ���� ���� �з�
    %min�� �ּڰ� v�� �ε��� v�� �˷��ݴϴ�
    [min1v, min1i] = min(d1);
    res_classify(1, i)=min1i;
    
    
end


figure(1); hold on
axis([-6 12 -8 12]);
grid on

plot(X1(:,1), X1(:,2), '*'); % c1
hold on;
plot(X2(:,1), X2(:,2), 'ro'); % c2
res=reshape(res_classify(1,:),size(x));
contour(x,y,res);



