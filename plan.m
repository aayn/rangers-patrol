p = rand(9, 1);

% Animal density : Animal density is a number signifying the number of
%                  animals in a particular cell.
% animal_den_i = density of animals in cell i.
animal_den = [40; 18; 44; 34; 22; 36; 29; 21; 24];


% history : This vector gives a degree corresponding to different cells
%           based on prior poacher activity
% history_i = degree of poacher activity in cell i.
history = [17; 35; 39; 15; 28; 33; 36; 32; 29];


% vulnerability : Gives an estimate on how easy it is to poach in a
%                 particular cell.
% vulnerabilty_i = ease of poaching in cell i.
vulnerability = [43; 36; 11; 18; 21; 39; 4; 16; 29];

% gamma : Gives an estimate of the decay factor in accurate prediction of
%         patrol strategies.
gamma = 0.999;

% These factors give weights to contribution of animal density,
% vulnerabiltiy and history.
alpha = 0.3;
beta = 0.2;

% This is the optimization function for x, where x is set of patrolling
% strategies for 10 days
fun = @(x) 1/ CUF(history, animal_den, vulnerability, alpha, beta, x, gamma);% .* Ud(d, p));

% This is the initial values of x set randomly
x0 = rand(9, 10);

% A corresponds to linear inequality constraints 
% b corresponds to number of patrollers at time instant i
A = zeros(10, 90);
b = [5 5 5 5 5 5 5 5 5 5].';

% set indices of sparse matrix A to ones for every
%[ 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 .....]
%[ 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 .....]
%[ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .....]
%[ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .....]
%[ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .....]

for i = (1 : 10)
    A(i, (9 * (i - 1)) + 1 : i * 9) = ones(1, 9);
end

p2 = 72;

% lower bounds for linear inequalities
lb = zeros(9, 10);
% upper bounds for linear inequalities
ub = ones(9, 10);

% set of non linear constraints.
nonlcon = []; 
options = optimset('Largescale','off','Display','iter', 'MaxFunEvals', 100000);
% fmincon finds the minimum of a problem specified by parameters like linear
% inequalities , non linear inequalities, 
[x, fval] = fmincon(@(x)fun(x), x0, A, b, [], [], lb, ub, nonlcon, options);

