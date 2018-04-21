load data1_1

h=2.0; 
N=size(X1,1);

[x, y] = meshgrid([-5:0.1:5], [-5:0.1:5]);

for i=1:size(x, 1)
  for j=1:size(x,2)
    txy=[x(i,j), y(i,j)];
    
    for n=1:N
      ksum(n)=(exp((-(X1(n,:)-txy)* (X1(n,:)-txy)')/(2*h^2)))/(2*pi);
    end
    k(i,j)=sum(ksum);
  end
end

pxyg = k/(h^2*N);
figure(4); 
mesh(x,y,pxyg); 
hold on;
      