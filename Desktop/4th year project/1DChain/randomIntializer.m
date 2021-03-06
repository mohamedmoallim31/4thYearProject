%provide random initial conditions

function initial = randomIntializer(numberOfParticles)
    %p0 = 2.*transpose(rand(numberOfParticles,1))-1;
    p0 = 0.1*normrnd(0,1,1,numberOfParticles);
    meanOfp0 = mean(p0);
    p0 = p0 - meanOfp0;
    %note randn returns a number from the standard normal distribution

    for i=1:numberOfParticles
        q0(i) = i;
    end
    initial = {p0, q0};
end