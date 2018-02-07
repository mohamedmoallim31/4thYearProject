function [p, q] = latticeSimulation(p0, q0, numberOfSteps, timeStep)
    
    %taking m = 1
    p = cell(numberOfSteps+1,1);
    q = cell(numberOfSteps+1,1);
    p{1} = p0;
    q{1} = q0;
    pStepOld = p0;
    qStepOld = q0;
    F = generateForceVector(q0);
    for n=1:numberOfSteps+1        
        %phalfstep
        pHalfStep = pStepOld + (timeStep/2)*generateForceVector(qStepOld);
        
        %qstep
        qStepNew = qStepOld + timeStep*(pHalfStepe);
        
        %pstep
        F = generateForceVector(qStepNew);
        pStepNew = pHalfStep + (timeStep/2)*F;
        
        pStepOld = pStepNew;
        qStepOld = qStepNew;
        p{n} = pStepNew;
        q{n} = qStepNew;
    end


end

