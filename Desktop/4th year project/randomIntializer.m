%provide random initial conditions

function initial = randomIntializer(numberOfParticles)
    p0 = 2.*transpose(rand(numberOfParticles,1))-1;
    q0 = rand;

    for i=1:numberOfParticles-1
        q0(i + 1) = q0(i) + 1 - (rand/100);
    end
    initial = {p0, q0};
end