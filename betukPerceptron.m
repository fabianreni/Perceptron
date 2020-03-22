close all; 
clc;
clear all;
bem=[ 1,1,0,1,1,1,1,1,0,1; 
      1,0,1,0,0,1,0,0,1,0];
eredmeny= [1;0];
[N, n] = size(bem);
tanulrata=1;
s=rand(N,n);
E=1;
%rektor ur altal hasznalt kodresz
% for i=1:50
%    y(i)=-10*i/50+5;
%    ay(i)=1/(1+exp(-10*y(i)));
% end
% plot(y,ay); hold on; grid on;pause;

hold on; grid on;
E=1;
while E~=0
    E=0;
    for i=1:N
        yi = 0;
        for j=1:n
            yi = yi + bem(i,j)*s(i,j);
        end;
        if yi>=0
            yo=1;
        else
            yo=0;
        end;
       y(i) = yo;
       ei = eredmeny(i) - yo;
       s = s + tanulrata*ei*bem(i,:);
       E = E + ei^2;
    end
    for i=1:N
        if yi==0
            hold on; grid on;
            plot(yi,y(i),'ro','LineWidth',2.0);
        end;
        if yi>0
               hold on; grid on;
               plot(yi,y(i),'bo','LineWidth',2.0);
         end;
     end;
   
    pause()
    y
end;
