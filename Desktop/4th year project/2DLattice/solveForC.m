function [ C ] = solveForC(B, numberOfParticlesInLatticeRow, numberOfSteps, timestep)
%SOLVEFORC Summary of this function goes here
%   Detailed explanation goes here
     Qu = generateQu(B, numberOfParticlesInLatticeRow);
     Qv = eye(2*numberOfParticlesInLatticeRow^2) - generatePv(B);
     
     D = forceConstantMatrix(numberOfParticlesInLatticeRow);
     
     A = cell(numberOfSteps,1);
     C = cell(numberOfSteps,1);
     %set initial conditions
     a = size(B);
     n = a(1);
     Ak = zeros(2*numberOfParticlesInLatticeRow^2);
     A{1} = Ak;
     
     Ck = -B*D*Qu;
     C{1} = Ck;
     
     for k = 2:numberOfSteps
         Akhalfstep = Ak + ((timestep/2)*(-Ck*Qv*D));
         Cknext = Ck+((timestep)*Akhalfstep);
         Aknext = Ak + ((timestep/2)*(-Cknext*Qv*D));
         Ak = Aknext;
         Ck = Cknext;
         C{k} = Ck;
         A{k} = Ak;
     end

end

