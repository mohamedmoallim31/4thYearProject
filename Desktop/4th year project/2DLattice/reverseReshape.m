function [ reverseReshape ] = reverseReshape(q, n)
    N2 = n^2;
    
    reverseReshape = zeros(2,N2);
    reverseReshape(1,:) = q(1:2:end);
    reverseReshape(2,:) = q(2:2:end);
end

