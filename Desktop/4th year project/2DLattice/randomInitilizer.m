function [p0, q0] = randomInitilizer(gridDimension)
    n = gridDimension;
    p0 = 0.2*randn(n*n,2);
    meanOfp0 = mean(p0,1);
    p0 = p0 - meanOfp0;
    p0 = p0';
    
    %note randn returns a number from the standard normal distribution
    q = zeros(n*n, 2);

    for j=0:n-1
        for i=1:n
            q(i + j*n, 1) = j + (randn/100);
            q(i + j*n, 2) = i + (randn/100);
        end
    end
    q0 = transpose(q);    
end

