%function f = fminc(x)
%    f = sum(x);
%    x0 = [10; 10; 10];
%    p1 = 1;
%    p2 = 72;
%    lb = [0 0 0];
%    ub = [ 50 50 50];
%    options = optimset('Largescale','off','Display','iter');
%    [x, fval] = fmincon(@(x)fun(x,p1), x0, [], [], [], [], lb, ub, @(x)nonlcon(x,p1,p2), options)
%end
p = rand(9, 1);
d = [10; 2; 4; 5; 15; 18; 19; 22; 26];

fun = @(x) sum(x .* Ud(d, p));
x0 = rand(9, 1);
% p1 = Ud(d, p);
p2 = 72;
lb = zeros(9, 1);
ub = ones(9, 1);
nonlcon = [];
options = optimset('Largescale','off','Display','iter');
[x, fval] = fmincon(@(x)fun(x), x0, [], [], [], [], lb, ub, nonlcon, options);

