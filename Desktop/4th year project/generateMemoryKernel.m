function memoryKernel = generateMemoryKernel(B, numberOfParticles, numberOfSteps, timestep)
    theta = generateTheta(B, numberOfParticles, numberOfSteps, timestep);
    memoryKernel = cell(numberOfSteps,1);
    for i = 1:numberOfSteps
        memoryKernel{i} = (B*transpose(B))\(theta{i}/(B*transpose(B)));
    end
end

