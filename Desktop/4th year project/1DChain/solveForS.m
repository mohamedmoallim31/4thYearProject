function S = solveForS(B, numberOfParticles, numberOfSteps, timestep)
    %Attempt to use method from molecular dynamics book to solve for C
    %   A = m *((d/dt)*C)


     Qv = eye(numberOfParticles) - generatePv(B);
     D_0 = -2*72;
     D_mod1 = 72;
     D = -full(gallery('tridiag', numberOfParticles, D_mod1,D_0,D_mod1));
     D(1,1) = -72;
     D(numberOfParticles,numberOfParticles)=-72;
     A = cell(numberOfSteps,1);
     S = cell(numberOfSteps,1);
     %set initial conditions
     Ak = -B*D*Qv;
     A{1} = Ak;
     n = size(B);
     n = n(1);
     Sk = zeros(n, numberOfParticles);
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

