function [ U ] = Ud( d, p )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    U = p .* d - (1 - p) .* d;
end

