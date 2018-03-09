function [ binNo ] = binNo(sampleSize, significanceLevel)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    c = norminv(significanceLevel);
    binNo = 4*floor(nthroot(2*(((sampleSize-1)^2)/c^2), 5));
end

