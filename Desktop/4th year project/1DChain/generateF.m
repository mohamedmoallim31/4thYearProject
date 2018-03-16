function F = generateF(B, numberOfParticles, numberOfSteps, timeStep, v0, u0)
    
    eqV = zeros(numberOfParticles,1);
    eqU = [1:numberOfParticles]';
    
    [C, S] = solveForCS(B, numberOfParticles, numberOfSteps, timeStep);
    % S = solveForS(B, numberOfParticles, numberOfSteps, timeStep);
    
    F = cell(numberOfSteps, 1);
    for j = 1:numberOfSteps
        F{j} = C{j}*(u0-eqU) + S{j}*(v0-eqV);
    end
end