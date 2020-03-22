close all; 
clc;
clear all;
bem=[ 0 0; 0 1; 1 0; 1 1];
anderedmeny= [0;0;0;1];
tanulrata=1;
 w=randn(2,1); 
%suly
s1=1;
s2=1;
b=-1;

hold on; grid on;
%plot(x,x*s1+b);
E=1;
while E~=0
    E=0;
    for i=1:4
        yi=bem(i,1)*s1+bem(i,2)*s2+b;
        if yi>=0
            yo=1;
        else
            yo=0;
        end;
        y(i)=yo;
        if anderedmeny(i)==yo
            sv1=0;
            sv2=0;
            db=0;
        else
            sv1=tanulrata*(anderedmeny(i)-yo)*bem(i,1);
            sv2=tanulrata*(anderedmeny(i)-yo)*bem(i,2);
            db=tanulrata*(anderedmeny(i)-yo);
        end;
        s1=s1+sv1;
        s2=s2+sv2;
        b=b+db;
        E=E+(anderedmeny(i) - yo)^2;
    end
    clf('reset');
    hold on; grid on;
    axis([-1 2 -1 2]);
    title('press a key');
    for i=1:4
        if y(i)==0
            %plot(bem,bem*(w+tanulrata*(anderedmeny(i)-yi)*bem(i,:)')+b);
            plot(bem(i,1),bem(i,2), 'r*', 'LineWidth', 5); end;
        if y(i)>0
             %plot(bem,bem*(w+tanulrata*(anderedmeny(i)-yi)*bem(i,:)')+b);
             plot(bem(i,1),bem(i,2), 'ko', 'LineWidth', 5 ); end;
    end;
    pause()
end;

title('And');


