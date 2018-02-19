function [p0, q0] = randomInitilizer(gridDimension)
    n = gridDimension;
    p0 = 2.*transpose(rand(n^2,2))-1;
    meanOfp0 = mean(p0);
    p0 = p0 - meanOfp0;
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

