function firstTermFrom26 = generateFirstTermFrom26(R, B, q, n)
    
    qEq = zeros(2,n*n);

    for j=0:n-1
        for i=1:n
            qEq(1,i + j*n) = j;
            qEq(2,i + j*n) = i;
        end
    end
    qEqReduced = (B*myreshape(qEq,n)')';

    v = R*transpose(q-qEqReduced);
    v = reverseReshape(v, n);
    a = generateForceVector(qEq+v);
    a = transpose(myreshape(a,n));
    firstTermFrom26 = transpose(R)*a;
end

