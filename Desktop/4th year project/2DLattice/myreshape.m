function [ myreshape ] = myreshape(q, n)
    N2 = n^2;
    
    myreshape = zeros(1,2*N2);
    for i = 1:N2
        myreshape(2*i-1) = q(1,i);
        myreshape(2*i  ) = q(2,i);
    end
end

