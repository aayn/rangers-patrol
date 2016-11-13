p = rand(9, 1);
d = [10; 2; 4; 5; 15; 18; 19; 22; 26];
o = [44; 53; 75; 28; 24; 36; 14; 38; 91];
gamma = 0.99;

fun = @(x) -CUF(o, x, gamma);% .* Ud(d, p));
x0 = rand(9, 10);
% p1 = Ud(d, p);
A = ones(10, 90);
b = [5 3 3 3 3 3 3 3 3 3].';
p2 = 72;
lb = zeros(9, 10);
ub = ones(9, 10);
nonlcon = [];
options = optimset('Largescale','off','Display','iter');
[x, fval] = fmincon(@(x)fun(x), x0, A, b, [], [], lb, ub, nonlcon, options);

