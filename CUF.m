function [ u ] = CUF(h, ad, v, alpha, beta, X, gamma)

    % X is the variable set being maximized. C is now the distribution of
    % patrollers at the nth iteration of the optimization function
    % C -- row denotes the ith cell from top left to bottom right of
    % rectangular grid. Column denotes the time steps .
    C = X;
    k = size(C, 2);
    i = size(C, 1);
    
    J = ones(k, k);
    
    % forms ones of upper right triangular matrix
    K = tril(J).';
    
    g = (1 : k);
    ga = power(gamma, g);
    ga = repmat(ga, k, 1);
    
    for i = (0 : 9)
        ga(i + 1, :) = ga(i + 1, :) / (gamma ^ i);
    end
    
    % K represents the decay factor matrix 
    % 1 g g^2 g^3 ...
    % 0 1 g   g^2 ..
    % 0 0 1   g  ..
    % 0 0 0   1  ...
    % . . .   . .. 
    % . . .   . ...
    K = K .* ga;
    
    % matrix multiplying C to decay factor matrix so that future C values
    % are less dependent on the past C values
    C = C * K;
    
    % summing rows to 
    s = sum(C, 2) ./ k;
    
    % behavioural and surrounding factors that determine the utility at each cell
    all_factors = ad * alpha + v * beta + h * (1 - alpha - beta);
    u = s .* all_factors;
    u = sum(u);

end

