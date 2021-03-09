clc
clearvars;
syms x1 x2 y1 y2 t 
%input signals sint(t) and cos(t)
x1 = matlabFunction(sin(t));
x2 = matlabFunction(cos(t));

%Output of system S is y(t) = S(x(t))
%System: y(t) = tx(t)^2
S = @(x)(t*x^2);

%checking linearity of the system S using input signals x1(t) and x2(t)
linearity(S,x1,x2);

%Function to check whether the system is linear or non-linear
function linearity(S, x1,x2)
syms t
a = rand();
b = rand();
y1 = S(a*x1(t)+b*x2(t));
y2 = a*S(x1(t))+b*S(x2(t));
y1 = matlabFunction(y1);
y2 = matlabFunction(y2);
t = 0:0.01:30;
subplot(211);
plot(t, y1(t));xlabel("t");ylabel("S(ax1(t)+bx2(t))");
title("Linearity");
subplot(212);
plot(t, y2(t));xlabel("t");ylabel("aS(x1(t))+bS(x2(t))");
title("Linearity");
for t = 0:0.01:1000
   if(y1(t) ~= y2(t))
       %If the system is not linear 
      disp("System is non-linear");
      break;
   end
end
end

%Function to check whether the system is time invariant or time variant
function timeinvariance(S,x)
t0 = rand();
syms t
y1 = S(x(t));
y1 = matlabFunction(y1);
y2 = S(x(t-t0));
y2 = matlabFunction(y2);
t = 0:0.01:30;
subplot(211);
plot(t, y1(t-t0));xlabel ("t");ylabel("y(t-t0)");
title("Time Invariance");
subplot(212);
plot(t, y2(t));xlabel("t");ylabel("S(x(t-t0))");
title("Time Invariance");
for t = 0:0.01:1000
   if(y1(t-t0) ~= y2(t))
      %If the system is non time invariant
      disp("System is time variant");
      break;
   end
end
end