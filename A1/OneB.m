syms t
x = matlabFunction(1-exp(-3*t));
X = laplace(x,t,s);
Y = H*X;
y = matlabFunction(ilaplace(Y));

t = 0:0.0001:5;
subplot(211);
plot(t, x(t));
xlabel("t");ylabel("x(t)");
subplot(212);
plot(t,y(t));
xlabel("t");ylabel("y(t)");
