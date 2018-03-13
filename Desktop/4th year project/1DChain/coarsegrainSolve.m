function [p,q] = coarsegrainSolve(B, R, v0, u0, numberOfParticles, memoryKernel, stepSize, numberOfSteps)
    

    %get p0 q0 from v0 u0 
    p0 = B*v0;
    q0 = B*u0;
    sizeB = size(B);
    numberOfCoarseGrainParticles = sizeB(1);
    M = (B*transpose(B))^-1;
    p = [];
%     p = zeros(numberOfSteps+1, numberOfCoarseGrainParticles);
    q = zeros(numberOfSteps, numberOfCoarseGrainParticles);
    
    p(1,:) = p0;
    q(1,:) = q0;
    F = generateF(B, numberOfParticles, numberOfSteps, stepSize,v0,u0);
    f_0 = generatef_0(B, numberOfParticles, numberOfSteps, stepSize,u0);
    pStepOld = p0;
    qStepOld = q0;
    for n=2:numberOfSteps
        firstTerm = generateFirstTermFrom26(R, qStepOld, numberOfParticles);
        t = n*stepSize;
        secondTerm  = generateTerm2Of26(memoryKernel, p, stepSize, t, numberOfCoarseGrainParticles);
        pHalfStep = pStepOld - (stepSize/2)*(M\(firstTerm + secondTerm-M*F{n}-f_0{n}));
        
        qStepNew = qStepOld + stepSize*(pHalfStep);
        
        %% Please add in update to firstTerm and secondTerm as above
        
        pStepNew = pHalfStep - (stepSize/2)*(M\(firstTerm + secondTerm-M*F{n}-f_0{n}));
        
        p(n,:) = pStepNew;
        q(n,:) = qStepNew;
        
        pStepOld = pStepNew;
        qStepOld = qStepNew;
    end
end

