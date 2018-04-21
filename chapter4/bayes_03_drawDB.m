clear;

K=3;
load data4_1.mat 

% avg Mean for per class
M=[ mean(X1);mean(X2);mean(X3)]; 

S(:,:,1) = cov(X1);
S(:,:,2) = cov(X2);
S(:,:,3) = cov(X3);

smean=(cov(X1) + cov(X2) + cov(X3)) / 3 ;

% Create Input matrix by  dividing 2D input space into grid form
[x,y] = meshgrid([-2.5:0.2:5.5],[-2.5:0.2:5.5]);
XY=[x(:), y(:)];


for i =1:size(XY,1)
    for j=1:K
        d1(j,1) = (XY(i,:)-M(j,:)) * (XY(i,:)-M(j,:))';
        d2(j,1) = (XY(i,:)-M(j,:)) * inv(smean) * (XY(i,:)-M(j,:))';
        d3(j,1) = (XY(i,:)-M(j,:)) * inv(reshape(S(:,:,j),2,2)) * (XY(i,:)-M(j,:))';
    end
    
    [min1v, min1i] = min(d1);
    res_classify(1, i)=min1i;
    
    [min2v, min2i] = min(d2);
    res_classify(2, i)=min2i;
    
    [min3v, min3i] = min(d3);
    res_classify(3, i)=min3i;
end

for m=1:3
    figure(m); hold on
    axis([-2.5 5.5 -2.5 5.5]);
    grid on
    
    plot(X1(:,1), X1(:,2), '*');
    plot(X2(:,1), X2(:,2), 'ro');
    plot(X3(:,1), X3(:,2), 'kd');
    
    res = reshape(res_classify(m,:),size(x));
    
    contour(x,y,res); % drawing decision boundaries
end
