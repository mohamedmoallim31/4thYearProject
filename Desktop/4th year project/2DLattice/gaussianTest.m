%n is the number of particles in a row
n = 16;
B = zeros(2*n^2,8);
B(2*(2+1*n)-1, 1) = 1;
B(2*(2+1*n), 2) = 1;
B(2*(n-1+1*n)-1, 3) = 1;
B(2*(n-1+1*n), 4) = 1;
B(2*(2+(n-2)*n)-1, 5) = 1;
B(2*(2+(n-2)*n), 6) = 1;
B(2*(n-1+(n-2)*n)-1, 7) = 1;
B(2*(n-1+(n-2)*n), 8) = 1;
B = transpose(B);

numberOfCoarseGrainParticles = 4;
numberOfSteps = 1000;
timeStep = 1/200;
[v0,u0] = randomInitilizer(n);

%calculate full trajectory
[v,u] = latticeSimulation(n,v0,u0, numberOfSteps, timeStep);

M = (B*transpose(B))^(-1);
p = zeros(numberOfSteps+1, 2*numberOfCoarseGrainParticles);
q = zeros(numberOfSteps+1, 2*numberOfCoarseGrainParticles);
for i = 1:numberOfSteps+1
    p(i,:) = B*transpose(v{i});
    q(i,:) = B*transpose(u{i});
end

deriv = zeros(numberOfSteps, 2*n^2);
for i = 1:numberOfSteps
    deriv(i,:) =(v{i+1}-v{i})/timeStep;
end

R = generateR(B, n);
test = zeros(1, 2*numberOfCoarseGrainParticles);
for k = 1:numberOfSteps
    firstTerm = generateFirstTermFrom26(R, q(k,:),n);
    test(k,:) = transpose(firstTerm - M*B*transpose(deriv(k,:)));
end


