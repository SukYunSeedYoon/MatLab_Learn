
clf;
N=100;

m1=[0 0]; 
m2=[0 5];
s1=[10 2 ; 2 1];



X1=randn(N,2)*sqrtm(s1)+repmat(m1,N,1);
X2=randn(N,2)*sqrtm(s1)+repmat(m2,N,1);
figure(1);

plot( X2(:,1), X2(:,2), 'ro');
hold on;
plot( X1(:,1), X1(:,2), '*');
axis([-10 10 -5 10]);
save homework_init N X1 X2

