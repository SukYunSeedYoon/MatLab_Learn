load data1_1

m1 = mean(X1);
m2 = mean(X2);
m3 = mean(X3);
m4 = mean(X4);

s1 = cov(X1);
s2 = cov(X2);
s3 = cov(X3);
s4 = cov(X4);


save mean1_2 m1 m2 m3 m4 s1 s2 s3 s4;