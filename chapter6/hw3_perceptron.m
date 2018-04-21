clear;


NumD = 10;

S = [3 0 ; 0 3];
train_c1 = rand(NumD,2) * sqrtm(S) ;
train_c2 = rand(NumD,2) + repmat([4 2], NumD, 1);
train = [train_c1; train_c2];

train_out(1:NumD,1) = zeros(NumD,1);
train_out(1+NumD:2*NumD,1)=zeros(NumD,1)+1;



figure(1);
hold on;

axis([-4 8 -4 8]);
grid on;


plot( train(1:NumD,1), train(1:NumD,2),'r*'); 
hold on;
pause;
plot( train(1+NumD:2*NumD,1), train(1+NumD:NumD*2, 2), 'o');
hold on;
pause;



% �ִ� �ݺ� Ƚ��
Mstep = 5;

% ����� ���� ����
INP = 2;
OUT = 1;

% �Ķ���� �ʱ�ȭ
w=rand(INP, 1) * 0.4 -0.2;
wo=rand(1) * 0.4-0.2;

% ��������� ���
a=[ -3 : 0.1: 6 ];  
plot(a, (-w(1,1)*a-wo)/w(2,1));
hold on;
pause;

% �н��� ����
eta=0.5;

% ��� �н� �����Ϳ� ���� �ݺ� Ƚ����ŭ �н�
for j = 2 : Mstep
    for i = 1 : NumD*2
        x=train(i,:);
        ry=train_out(i,1);
        
        % �ۼ�Ʈ�� ���
        if (x*w+wo>0)
            y=1;
        else
            y=0;
        end
        
        % ���� ���
        e=ry-y;     
        E(i, 1)=e; 
        dw=eta * e * x';
        dwo=eta*e*1;
        w=w+dw;
        wo=wo+dwo;
    end
    
    % ��ȭ�� ���� ��� ���
    plot(a, (-w(1,1)*a-wo)/w(2,1),'--');
    pause;
end

            

