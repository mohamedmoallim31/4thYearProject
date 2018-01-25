function forceVector = generateForceVector(q)
    N2 = length(q);
    n = sqrt(N2);
    forceVector = zeros(2,N2);
    for i = 1:N2
        forceVector(:,i) = force(i, n, q, @deriv_u1, @deriv_u2);
    end 
end

