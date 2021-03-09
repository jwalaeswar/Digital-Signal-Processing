clc
clearvars
syms z n
H = (6*z^2)/((3*z-1)*(2*z-1));
h = matlabFunction(iztrans(H))
n = 0:15;
stem(h(n));
xlabel("n");ylabel("h[n]");