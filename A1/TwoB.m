clear n
syms n z
x = matlabFunction(1 - 8^n);
X = ztrans(x, n, z);
Y = H*X
y = matlabFunction(iztrans(Y))
y(1);
n = 0:10;
stem(n,y(n));

