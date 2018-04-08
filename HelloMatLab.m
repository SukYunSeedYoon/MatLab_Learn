x=pi/5;
LHS=cos(x/2) ^2
RHS=(tan(x)+sin(x))/((2*tan(x)))


% Solution fo sample problem 1-2

R1 = 16; R2=6.5; R3=12; R4=9.5;

C1C2=R1+R2; C1C3=R1+R3; C1C4=R1+R4;
C2C3=R2+R3; C3C4=R3+R4;

Gama1=acos((C1C2^2 + C1C3^2 - C2C3^2) / (2*C1C2*C1C3));
Gama2=acos((C1C3^2 + C1C4^2 - C3C4^2)/(2*C1C3*C1C4));
Gama3=Gama1 + Gama2;

C2C4 = sqrt(C1C2^2 + C1C4^2 - 2*C1C2* C1C4*cos(Gama3))
