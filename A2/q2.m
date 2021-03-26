clc
clearvars
syms z
%G(z)
G = (9 + 33*z^-1 + 57*z^-2 + 33*z^-3 + 12*z^-4)/(6 - 12*z^-1 + 11*z^-2 - 5*z^-3 + z^-4);
%returns factors of G(z)
num = factor(G);
g = 1;
%Returns G(z) interms of factors i.e., factorized form
for i = num
    g = g*i;
end
%G(z) in factored form
G = g