load data1_1

h=1.0; 
N=size(X1,1);
[x,y] = meshgrid([ -5:0.1:5], [ -5:0.1:5]);

% 입력공간의 모든 입력에 대해 확률 밀도값 계산
for i=1:size(x,1)
  for j=1:size(x,2)
    k(i,j)=0;
    % 커널 함수 값 계산
    for n=1:N
        
        %A_1 = abs(X1(n,1)-x(i,j));
        %AL = X1(n,1);
        %AR = x(i,j);
        %A_1 = abs(AL - AR);
        %A_2 = (h/2);
        %resAA = A_1 < A_2;
        
        %BL = X1(n,2);
        %BR = y(i,j);
        %B_1 = abs(BL-BR);
        %B_1 = abs(X1(n,2)-y(i,j));
        %B_2 = (h/2);
        %resBB = B_1 < B_2;
        resA =(abs(X1(n,1)-x(i,j))<(h/2));
        resB =(abs(X1(n,2)-y(i,j))<(h/2));
        
      if (resA && resB)
        k(i,j)=k(i,j)+1;
      end
    end
  end
end

pxyp = k/(h^2*N); 
figure(3); 
mesh(x,y,pxyp);
hold on;

  

