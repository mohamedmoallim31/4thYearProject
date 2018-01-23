function theta = generateTheta(B, numberOfParticles, numberOfSteps, timestep)
    C = solveForC(B, numberOfParticles, numberOfSteps, timestep);
    theta = cell(numberOfSteps,1);
    for i = 1:numberOfSteps
        theta{i} = -C{i}*transpose(B);
    end
end

