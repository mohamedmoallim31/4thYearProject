%commute first term

function firstTerm = generateFirstTermFrom26(B, q, numberOfParticles)
    R = generateR(B, numberOfParticles);
    v = R*q;
    a = zeros(numberOfParticles, 1);
    a(1) = deriv_phi(v(2) - v(1));
    for i = 2:numberOfParticles-1
        a(i) = deriv_phi(v(i+1) - v(i)) - deriv_phi(v(i) - v(i-1)); 
    end
    a(numberOfParticles) = -deriv_phi(v(numberOfParticles) - v(numberOfParticles-1));
    firstTerm = -transpose(R)*a;
end