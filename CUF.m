function [ u ] = CUF( o, C, gamma)
    k = size(C, 2);
    i = size(C, 1);
    
    g = (k : -1: 1);
    ga = power(gamma, g);
    ga = repmat(ga, i, 1);
    
    C = ga .* C;
    s = sum(C, 2) ./ k;
    u = s .* o / 100;
    u = sum(u);

end

