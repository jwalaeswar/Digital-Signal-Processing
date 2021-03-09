clc
syms s t 
H = 1/((s^2)+(9*s)+9);
h = matlabFunction(ilaplace(H))
t = 0:0.0001:5;
plot(t,h(t));
xlabel("t");
ylabel("h(t)");

