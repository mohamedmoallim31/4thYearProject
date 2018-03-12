function A = solveForC(B, numberOfParticles, numberOfSteps, timestep)
%Attempt to use method from molecular dynamics book to solve for C
%   A = m *((d/dt)*C)

     Qu = generateQu(B, numberOfParticles);
     Qv = eye(numberOfParticles) - generatePv(B);
     D_0 = -2*72;
     D_mod1 = 72;
     D = -full(gallery('tridiag', numberOfParticles, D_mod1,D_0,D_mod1));
     D(1,1) = -72;
     D(numberOfParticles,numberOfParticles) = -72;
     
     A = cell(numberOfSteps,1);
     C = cell(numberOfSteps,1);
     %set initial conditions
     a = size(B);
     n = a(1);
     Ak = zeros(n, numberOfParticles);
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

