function theta = generateTheta(B, numberOfParticles, numberOfSteps, timestep)
    [C, S] = solveForCS(B, numberOfParticles, numberOfSteps, timestep);
    
    Qu = generateQu(B, numberOfParticles);
    
    D_0 = -2*72;
    D_mod1 = 72;
    D = full(gallery('tridiag', numberOfParticles, D_mod1,D_0,D_mod1));
    D(1,1) = -72;
    D(numberOfParticles,numberOfParticles) = -72;
    D=-D;
    Dinv = pinv(D);
    
    M = Dinv*Qu'*D*B';
    
    theta = cell(numberOfSteps,1);
    for i = 1:numberOfSteps
        theta{i} = -0.1*C{i}*M;
    end
end

