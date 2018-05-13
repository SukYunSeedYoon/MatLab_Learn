load data1_1
load mean1_2

Etrain100=0;
Etrain50=0;

N = size(X1, 1);
for i=1:N

  d1=norm(X1(i, :)-m1);
  d2=norm(X1(i, :)-m2);
  if( d1-d2) > 0
    Etrain100 = Etrain100+1;
  end
  
  d1=norm(X2(i, :)-m1);
  d2=norm(X2(i, :)-m2);
  if( d1-d2) < 0
    Etrain100 = Etrain100+1;
  end
end

F = size(X3, 1);
for i=1:F

  d1=norm(X3(i, :)-m3);
  d2=norm(X3(i, :)-m4);
  if( d1-d2) > 0
    Etrain50 = Etrain50+1;
  end
  
  d1=norm(X4(i, :)-m3);
  d2=norm(X4(i, :)-m4);
  if( d1-d2) < 0
    Etrain50 = Etrain50+1;
  end
  
end

fprintf(1, 'Training100 Error = %.3f\n', Etrain100/200);
fprintf(1, 'Training50 Error = %.3f\n', Etrain50/100);
