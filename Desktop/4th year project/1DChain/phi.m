%The Lennard-Jones Potential
function value = phi(r)
    a = (1/r)^6;
    value = a^2 - 2*a;
end 