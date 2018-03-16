function [p, q] = latticeSimulation(N, p0, q0, numberOfSteps, timeStep)
    
    %taking m = 1
    p = cell(numberOfSteps+1,1);
    q = cell(numberOfSteps+1,1);
    p{1} = myreshape(p0,N);
    q{1} = myreshape(q0,N);
    pStepOld = p0;
    qStepOld = q0;
    F = generateForceVector(q0);
    for n=1:numberOfSteps+1        
        %phalfstep
        pHalfStep = pStepOld + (timeStep/2)*F;
        
        %qstep
        qStepNew = qStepOld + timeStep*pHalfStep;
        
        %pstep
        F = generateForceVector(qStepNew);
        pStepNew = pHalfStep + (timeStep/2)*F;
        
        pStepOld = pStepNew;
        qStepOld = qStepNew;
        p{n} = myreshape(pStepNew,N);
        q{n} = myreshape(qStepNew,N);
    end


end

