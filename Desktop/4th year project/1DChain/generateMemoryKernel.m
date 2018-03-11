function memoryKernel = generateMemoryKernel(B, numberOfParticles, numberOfSteps, timestep)
    TOL = 1e-6;
    theta = generateTheta(B, numberOfParticles, numberOfSteps, timestep);
    memoryKernel = cell(numberOfSteps,1);
    for i = 1:numberOfSteps
        memoryKernel{i} = (B*transpose(B))\(theta{i}/(B*transpose(B)));
%         if det(memoryKernel{i}) < TOL
%             break;
%         end
    end
end

