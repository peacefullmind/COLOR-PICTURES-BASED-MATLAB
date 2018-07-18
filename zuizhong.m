clc
clear all
syms y;
 L=200;
r=178.5;
n=pi/180;
h=200;
answer=zeros(1000,7);
k=1;
for s1=-45*n:1*n:45*n
  for s2=-45*n:1*n:45*n
   % xi=(acos(((r*cos(s2)+L*sin(s2)*cos(s1)-r)*(sin(s2)*cos(s1))+L*(sin(s1)*sin(s1))+(-r*sin(s2)+L+L*cos(s2)*cos(s1))*(cos(s2)*cos(s1)))/(sqrt(((r*cos(s2)+L*sin(s2)*cos(s1)-r)^2)+((-L*sin(s1))^2)+((-r*sin(s2)+L+L*cos(s2)*cos(s1))^2)))))/(pi/180);
   % yi=(acos(((-r*sin(s2)*sin(s1)+L*sin(s2)*cos(s1))*(sin(s2)*cos(s1))-(-r*cos(s1)-L*sin(s1)+r)*(sin(s1))+(-r*cos(s2)*sin(s1)+L+L*cos(s2)*cos(s1))*(cos(s2)*cos(s1)))/(sqrt(((-r*sin(s2)*sin(s1)+L*sin(s2)*cos(s1))^2)+((-r*cos(s1)-L*sin(s1)+r)^2)+((-r*cos(s2)*sin(s1)+L+L*cos(s2)*cos(s1))^2)))))/(pi/180);
   yi=acos(cos(s2)*cos(s1))/(pi/180);
%     if ((y(xi)>=-45*n)&&(x(xi)<=45*n))
   % if (xi>=-90*n)&&(xi<=90*n)&&(yi>=-90*n)&&(yi<=90*n)
   if (yi>=-45)&&(yi<=45)
        
      %fprintf(('Current Number is: %d%d\n'),xi,yi);
     % xi
      yi
      answer(k,1:2)=[s1,s2];
      answer(k,7)=yi;
     % answer(k,7:8)=[rad2deg(xi),rad2deg(yi)];
      k=k+1;
    end
  end
end


jd1=answer(1:k-1,1)';
jd2=answer(1:k-1,2)';
j1=rad2deg(jd1);
j2=rad2deg(jd2);

ds1=(r*cos(jd2)+h*sin(jd2).*cos(jd1)-r).^2+(-h*sin(jd1)).^2+(-r*sin(jd2)+h+h*cos(jd2).*cos(jd1)).^2;
ds2=(-r*sin(jd2).*sin(jd1)).^2+(-r*cos(jd1)-h*sin(jd1)+r).^2+(-r*cos(jd2).*sin(jd1)+h+h*cos(jd1).*cos(jd2)).^2;
ds3=(-r*cos(jd2)+h*sin(jd2).*cos(jd1)+r).^2+(-h*sin(jd1)).^2+(r*sin(jd2)+h+h*cos(jd2).*cos(jd1)).^2;
ds4=(r*sin(jd2).*sin(jd1)+h*sin(jd2).*cos(jd1)).^2+(r*cos(jd1)-h*sin(jd1)-r).^2+(r*cos(jd2).*sin(jd1)+h+h*cos(jd1).*cos(jd2)).^2;
 answer(1:k-1,3)=ds1.^(1/2);
 answer(1:k-1,4)=ds2.^(1/2);
 answer(1:k-1,5)=ds3.^(1/2);
 answer(1:k-1,6)=ds4.^(1/2);
 
 answer(1:k-1,1)=j1;
 answer(1:k-1,2)=j2;

 
X=h.*sin(jd2).*cos(jd1);
Y=-h*sin(jd1);
Z=h.*cos(jd2).*cos(jd1)+h;
plot3(X,Y,Z)
xlabel('X');
ylabel('Y');
zlabel('Z');
