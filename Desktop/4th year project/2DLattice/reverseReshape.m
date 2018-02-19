function [ reverseReshape ] = reverseReshape(q, n)
    N2 = n^2;
    
    reverseReshape = zeros(2,N2);
    for i = 1:N2
        reverseReshape(1,i) = q(2*i-1);
        reverseReshape(2,i) = q(2*i  );
    end

end

