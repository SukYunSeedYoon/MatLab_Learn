N=500;
X = randn(N,2);

figure(1); plot(X(:,1), X(:,2),'*');
axis([-3 3 -3 3]);grid on

[x,y] = meshgrid( [-3:0.1:3], [-3:0.1:3]);

XY=[x(:),y(:)];
m=[0 0]; s=eye(1);

KK = size(XY,1);
for i=1:KK
    pxy(i,1)=1/sqrt(2*pi*det(s))*exp(-1/2*(XY(i,:)-m)*inv(s)*(XY(i,:)-m)');
end

pxy = reshape(pxy,size(x));

figure(2);
mesh(x,y,pxy);
hold on
save data3_1 X;