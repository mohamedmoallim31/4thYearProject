function C = solveForC(B, numberOfParticles, numberOfSteps, timestep)
%Attempt to use method from molecular dynamics book to solve for C
%   A = m *((d/dt)*C)

     Qu = generateQu(B, numberOfParticles);
     Qv = eye(numberOfParticles) - generatePv(B);
     D_0 = -2*72;
     D_mod1 = 72;
     D = full(gallery('tridiag', numberOfParticles, D_mod1,D_0,D_mod1));
     D(1,1) = -72;
     D(numberOfParticles,numberOfParticles) = -72;
     D=-D;
     
     C = cell(numberOfSteps,1);
     S = cell(numberOfSteps,1);
     %set initial conditions
     a = size(B);
     n = a(1);
     Sk = zeros(n, numberOfParticles);
     S{1} = Sk;
     
     Ck = -B*D*Qu;
     C{1} = Ck;
     
     for k = 2:numberOfSteps
         Skhalfstep = Sk + (timestep/2)*Ck*Qv;
         Cknext = Ck - ((timestep)*Skhalfstep*D*Qu);
         Sknext = Skhalfstep + (timestep/2)*Cknext*Qv;
         Sk = Sknext;
         Ck = Cknext;
         C{k} = Ck;
         S{k} = Sk;
     end
end

