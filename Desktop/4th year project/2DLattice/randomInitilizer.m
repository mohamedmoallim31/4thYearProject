function [p0, q0] = randomInitilizer(gridDimension)
    n = gridDimension;
    p0 = 0.2*randn(n*n,2);
    
    %note randn returns a number from the standard normal distribution
    q = zeros(n*n, 2);

    for j=0:n-1
        for i=1:n
            q(i + j*n, 1) = j + (randn/100);
            q(i + j*n, 2) = i + (randn/100);
        end
    end
    q0 = transpose(q);    
    
    % Now construct projection which sets both total linear and angular
    % momentum to zero
    L = zeros(3,2*n*n);
    L(1,1:2:end) = 1; % x momentum
    L(2,2:2:end) = 1; % y momentum
    L(3,1:2:end) = q0(2,:);
    L(3,2:2:end) = -q0(1,:);
    
    Lproj = null(L);
    Lproj = Lproj*Lproj';
    
    p0 = myreshape(p0',n);
    p0 = (Lproj*p0')';
    p0 = reverseReshape(p0,n);
    
end

