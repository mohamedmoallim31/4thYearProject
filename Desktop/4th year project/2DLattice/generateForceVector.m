function forceVector = generateForceVector(q)
    N2 = length(q);
    forceVector = zeros(1,N2);
    for i = 1:N2
        forceVector(i) = force(i, n, q, @deriv_u1, @deriv_u2);
    end 
end

