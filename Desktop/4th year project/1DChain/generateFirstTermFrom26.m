%commute first term

function firstTerm = generateFirstTermFrom26(R, B, q, numberOfParticles)
    %!!!!!
    qEq = [1:numberOfParticles]';
    qEqReduced = B*qEq;
    
    v = qEq+R*(q-qEqReduced);
    a = zeros(numberOfParticles, 1);
    a(1) = deriv_phi(v(2) - v(1));
    for i = 2:numberOfParticles-1
        a(i) = deriv_phi(v(i+1) - v(i)) - deriv_phi(v(i) - v(i-1)); 
    end
    a(numberOfParticles) = -deriv_phi(v(numberOfParticles) - v(numberOfParticles-1));
    firstTerm = -R'*a;
end