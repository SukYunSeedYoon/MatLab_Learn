clear;

load hw3_data;


figure(1);
hold on;

axis([-4 8 -4 8]);
grid on;


plot(train(1:NumD, 1), train(1:NumD, 2), 'r*'); 
hold on;
pause;
plot(train(1+NumD:2*NumD,1), train(1+NumD:NumD*2, 2), 'o');
hold on;
pause;

% 최대 반복 횟수
Mstep = 5;

% 입출력 차원 설정
INP = 2;
OUT = 1;

% 파라미터 초기화
w=rand(INP, 1) * 0.4 -0.2;
wo=rand(1) * 0.4-0.2;

% 결정경계의 출력
a=[ -3 : 0.1: 6 ];  
plot(a, (-w(1,1)*a-wo)/w(2,1));
hold on;
pause;

% 학습률 설정
eta=0.5;

% 모든 학습 데잍터에 대해 반복 횟수만큼 학습
for j = 2 : Mstep
    for i = 1 : NumD*2
        x=train(i,:);
        ry=train_out(i,1);
        
        % 퍼셉트론 출력
        if (x*w+wo>0)
            y=1;
        else
            y=0;
        end
        
        % 오차 계산
        e=ry-y;     
        E(i, 1)=e; 
        dw=eta * e * x';
        dwo=eta*e*1;
        w=w+dw;
        wo=wo+dwo;
    end
    
    % 변화된 결정 경계 출력
    plot(a, (-w(1,1)*a-wo)/w(2,1),'--');
    pause;
end

            


