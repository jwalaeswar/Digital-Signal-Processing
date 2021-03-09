clc
clearvars;
syms n x1 x2 y1 y2

x1 = matlabFunction(sin(n));
x2 = matlabFunction(cos(n));

S = @(x) n*x^2;

linearity(S, x1, x2);

function linearity(S, x1, x2)
syms n
a = rand();
b = rand();
y1 = S(a*x1(n) + b*x2(n));
y2 = a*S(x1(n)) + b*S(x2(n));
y1 = matlabFunction(y1);
y2 = matlabFunction(y2);
n = 0:1:30;
subplot(211);
stem(n, y1(n));xlabel("n");ylabel("S(ax1[n] + bx2[n])");
title("Linearity");
subplot(212);
stem(n, y2(n));xlabel("n");ylabel("aS(x1[n] + bS(x2[n]))");
title("Linearity");
z = 0;
for n = 0:1:1000
   if(y1(n) ~= y2(n))
      z = 1;
      disp("System is non-linear");
      break;
   end
end
if(z == 0)
   disp("System is linear");
end
end

function timeinvariance(S, x)
n0 = randi([0,100]);
syms n
y1 = S(x(n));
y2 = S(x(n-n0));
y1 = matlabFunction(y1);
y2 = matlabFunction(y2);
n = 0:1:30;
subplot(211);
stem(n, y1(n-n0));xlabel("n");ylabel("y[n-n0]");
title("Time Invariance");
subplot(212);
stem(n, y2(n));xlabel("n");ylabel("S(x[n-n0])");
title("Time Invariance");
z = 0;
for n = 0:1:1000
   if(y1(n-n0) ~= y2(n))
      z = 1;
      disp("System is Time variant");
      break;
   end
end
if(z == 0)
   disp("System is Time-Invariant"); 
end
end