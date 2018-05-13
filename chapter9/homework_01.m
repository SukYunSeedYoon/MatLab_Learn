
clf;
N=100;

m1=[0 0]; 
s1=[9 0 ; 0 1];

m2=[0 4];
s2=[9 0 ; 0 1];

X1=randn(N,2)*sqrtm(s1)+repmat(m1,N,1);
X2=randn(N,2)*sqrtm(s2)+repmat(m2,N,1);
figure(1);

plot( X2(:,1), X2(:,2), 'ro');
hold on;
plot( X1(:,1), X1(:,2), '*');
axis([-10 10 -5 10]);
save homework_init N X1 X2

