function memoryKernel = generateMemoryKernel(B, numberOfParticles, numberOfSteps, n, timestep)
    theta = generateTheta(B, numberOfParticles, numberOfSteps, n, timestep);
    memoryKernel = cell(numberOfSteps+1);
    for i = 1:numberOfSteps+1
        memoryKernel{i} = (B*transpose(B))/(theta{i}\(B*transpose(B)));
    end
end

