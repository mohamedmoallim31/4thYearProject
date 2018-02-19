function firstTermFrom26 = generateFirstTermFrom26(R, q, n)
    
    v = R*transpose(q);
    v = reverseReshape(v, n);
    a = generateForceVector(v);
    a = transpose(myreshape(a,n));
    firstTermFrom26 = -transpose(R)*a;
end

