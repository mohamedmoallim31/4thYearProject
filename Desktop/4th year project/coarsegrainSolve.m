function solution = coarsegrainSolve(B, R, p0, q0, numberOfParticles, memoryKernel, stepSize, numberOfSteps)
    
    M = (B*transpose(B))^-1;
    p = zeros(numberOfSteps+1, numberOfParticles);
    q = zeros(numberOfSteps+1, numberOfParticles);
    
    pStepOld = p0;
    qStepOld = q0;
    for n=1:numberOfSteps
        firstTerm = generateFirstTermFrom26(R, qStepOld, numberOfParticles);
        t = n*stepSize;
        secondTerm  = generateTerm2Of26(memoryKernel, pStepOld, stepSize, t);
        pHalfStep = pStepOld + (stepSize/2)*(M/(firsTerm - secondTerm));
        
        qStepNew = qStepOld + stepSize*(M/(pHalfStep));
        pStepNew = pStepOld + (stepSize/2)*(M/(firstTerm - secondTerm));
        
        pStepOld = pStepNew;
        qStepOld = qStepNew;
        p(n,:) = pStepNew;
        q(n,:) = qStepNew;
    end
    solution = {};
    solution{1} = p;
    solution{2} = q;
end

