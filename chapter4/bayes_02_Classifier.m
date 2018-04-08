clear;

K=3;
load data4_1.mat 

mm1 = mean(X1);
mm2 = mean(X2);
mm3 = mean(X3);

% avg Mean for per class
M=[ mean(X1);mean(X2);mean(X3)]; 

S(:,:,1) = cov(X1);
S(:,:,2) = cov(X2);
S(:,:,3) = cov(X3);


smean=(cov(X1) + cov(X2) + cov(X3)) / 3 ;
Dtrain=[X1;X2;X3];   

Etrain=zeros(3,1);
N = size(X1, 1);

for k=1:K
    X = Dtrain((k-1) * 100+1:k*100,:);
    for i=1:N
        for j=1:K
            d1(j,1) = (X(i,:)-M(j,:)) * (X(i,:)-M(j,:))';
            d2(j,1) = (X(i,:)-M(j,:)) * inv(smean) * (X(i,:)-M(j,:))';
            d3(j,1) = (X(i,:)-M(j,:)) * inv(reshape(S(:,:,j),2,2)) * (X(i,:)-M(j,:))';
        end
        
        [min1v, min1i] = min(d1);
        if(min1i~=k) 
            Etrain(1,1) = Etrain(1,1)+1; 
        end
        
        [min2v, min2i] = min(d2);
        if(min2i~=k) 
            Etrain(2,1) = Etrain(2,1)+1; 
        end
        
        [min3v, min3i] = min(d3);
        if(min3i~=k) 
            Etrain(3,1) = Etrain(3,1)+1; 
        end
    end
end

Error_rate = Etrain/(N*K)
   