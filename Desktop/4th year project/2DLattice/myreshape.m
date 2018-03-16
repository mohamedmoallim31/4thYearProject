function [ myreshape ] = myreshape(q, n)
    N2 = n^2;
    
    myreshape = zeros(1,2*N2);
    myreshape(1:2:end) = q(1,:);
    myreshape(2:2:end) = q(2,:);
end

