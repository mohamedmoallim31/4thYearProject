function [p0, q0] = randomInitilizer(gridDimension)
    n = gridDimension;
    p0 = 2.*transpose(rand(2*gridDimension*gridDimension,1))-1;
    meanOfp0 = mean(p0);
    p0 = p0 - meanOfp0;
    %note randn returns a number from the standard normal distribution
    q0 = zeros(gridDimension*gridDimension, 2);

    for j=0:gridDimension-1
        for i=1:gridDimension
            q0(i + j*n, 1) = j + (randn/100);
            q0(i + j*n, 2) = i + (randn/100);
        end
    end
    q0 =  transpose(q0);
end

