function [ u ] = CUF( o, X, gamma)
    C = X;
    k = size(C, 2);
    i = size(C, 1);
    
    J = ones(k, k);
    K = tril(J).';
    
    g = (1 : k);
    ga = power(gamma, g);
    ga = repmat(ga, k, 1);
    
    for i = (0 : 9)
        ga(i + 1, :) = ga(i + 1, :) / (gamma ^ i);
    end
    K = K .* ga;
    %C
    C = C * K;
    s = sum(C, 2) ./ k;
    u = s .* o;
    u = sum(u);

end

