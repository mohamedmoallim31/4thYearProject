function F = generateF(B, numberOfParticles, numberOfSteps, timeStep, v0, u0)
    
    eqV = zeros(numberOfParticles,1);
    
    eqU = zeros(numberOfParticles,1);
    eqU(1) = u0(1);
    for i = 2:numberOfParticles
        eqU(i) = eqU(i-1)+1;
    end
    
    C = solveForC(B, numberOfParticles, numberOfSteps, timeStep);
    S = solveForS(B, numberOfParticles, numberOfSteps, timeStep);
    
    F = cell(numberOfSteps, 1);
    for j = 1:numberOfSteps
        F{j} = C{j}*(u0-eqU) + S{j}*(v0-eqV);
    end
end

