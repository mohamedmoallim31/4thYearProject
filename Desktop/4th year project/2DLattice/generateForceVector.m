function forcev = generateForceVector(q)
    N2 = length(q);
    n = sqrt(N2);
    forceVector = zeros(2,N2);
    for i = 1:N2
        forceVector(:,i) = force(i, n, q, @grad_u1, @grad_u2);
    end 
    forcev = forceVector;
end

