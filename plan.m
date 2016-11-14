p = rand(9, 1);
d = [10; 2; 4; 5; 15; 18; 19; 22; 26];
o = [23; 44; 85; 33; 49; 52; 74; 82; 71];
gamma = 0.9;

fun = @(x) 1/ CUF(o, x, gamma);% .* Ud(d, p));
x0 = rand(9, 10);
% p1 = Ud(d, p);
A = zeros(10, 90);
for i = (1 : 10)
    A(i, (9 * (i - 1)) + 1 : i * 9) = ones(1, 9);
end

b = [3 3 3 3 3 3 3 3 3 3].';
p2 = 72;
lb = zeros(9, 10);
ub = ones(9, 10);
nonlcon = [];
options = optimset('Largescale','off','Display','iter', 'MaxFunEvals', 100000);
[x, fval] = fmincon(@(x)fun(x), x0, A, b, [], [], lb, ub, nonlcon, options);

