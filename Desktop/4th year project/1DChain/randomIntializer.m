%provide random initial conditions

function initial = randomIntializer(numberOfParticles)
    %p0 = 2.*transpose(rand(numberOfParticles,1))-1;
    p0 = 0.02*normrnd(0,1,1,numberOfParticles);
    meanOfp0 = mean(p0);
    p0 = p0 - meanOfp0;
    %note randn returns a number from the standard normal distribution
    q0 = randn;

    for i=1:numberOfParticles-1
        q0(i + 1) = q0(i) + 1 + (randn/100);
    end
    initial = {p0, q0};
end