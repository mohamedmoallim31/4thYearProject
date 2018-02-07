function [ S ] = solveForS(B, numberOfParticlesInLatticeRow, numberOfSteps, timestep)
%UNTITLED2 s of this function goes here
%   Detailed explanation goes here

     Qv = eye(2*numberOfParticlesInLatticeRow^2) - generatePv(B);
     D = -forceConstantMatrix(numberOfParticlesInLatticeRow);
     
     A = cell(numberOfSteps,1);
     S = cell(numberOfSteps,1);
     %set initial conditions
     Ak = -B*D*Qv;
     A{1} = Ak;
     n = size(B);
     n = n(1);
     Sk = zeros(2*numberOfParticlesInLatticeRow^2);
     S{1} = Sk;
     
     for k = 2:numberOfSteps
         Akhalfstep = Ak + ((timestep/2)*(-Sk*D*Qv));
         Sknext = Sk+((timestep)*Akhalfstep);
         Aknext = Ak + ((timestep/2)*(-Sknext*D*Qv));
         Ak = Aknext;
         Sk = Sknext;
         S{k} = Sk;
         A{k} = Ak;
     end



end

