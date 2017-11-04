function theta = generateTheta(B, numberOfParticles, numberOfSteps, n, timestep)
    C = solveForC(B, numberOfParticles, numberOfSteps, n, timestep);
    theta = cell(numberOfSteps+1);
    for i = 1:numberOfSteps+1
        theta{i} = -C{i}*transpose(B);
    end
end

