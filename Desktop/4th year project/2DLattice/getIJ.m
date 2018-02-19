function [i,j] = getIJ(ij,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    j = floor(ij/n);
    if (j - ij/n) == 0
        j = j - 1;
        i = ij - j*n;
    else
        i = ij - j*n;
    end 
end

