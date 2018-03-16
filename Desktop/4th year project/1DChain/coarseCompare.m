numberOfParticles = 8;
numberOfInitialSteps = 8000;
numberOfSteps = 1000;
timeStep = 1/1000;
t = linspace(0,1,numberOfSteps);
B = [1,0,0,0,0,0,0,0; 0,0,0,0,1,0,0,0; 0,0,0,0,0,0,0,1];
sizeB = size(B);
numberOfCoarseGrainParticles = sizeB(1);

% Initialise
initial = randomIntializer(numberOfParticles);
v0 = initial{1};
u0 = initial{2};
opt = struct;
opt.p0 = v0;
opt.q0 = u0;

% Run initial simulation to equilibriate
fullTrajectory = particleChainSimulation(timeStep, numberOfParticles, numberOfInitialSteps, opt);
v = fullTrajectory{1};
u = fullTrajectory{2};

% Set up new initial condition
v0 = v(end,:);
u0 = u(end,:);
opt.p0 = v0;
opt.q0 = u0;
fullTrajectory = particleChainSimulation(timeStep, numberOfParticles, numberOfInitialSteps, opt);
v = fullTrajectory{1};
u = fullTrajectory{2};

M = (B*transpose(B))^(-1);
p = zeros(numberOfSteps, numberOfCoarseGrainParticles);
q = zeros(numberOfSteps, numberOfCoarseGrainParticles);
for i = 1:numberOfSteps
    p(i,:) = B*transpose(v(i,:));
    q(i,:) = B*transpose(u(i,:));
end

v0 = transpose(v0);
u0 = transpose(u0);
p = transpose(p);
q = transpose(q);
p0 = p(:,1);
q0 = q(:,1);
p = transpose(p);
q = transpose(q);

R = generateR(B, numberOfParticles); % Check by premultiplying by B
memoryKernel = generateMemoryKernel(B, numberOfParticles, numberOfSteps,timeStep);
[cp,cq] = coarsegrainSolve(B, R, v0, u0, numberOfParticles, memoryKernel, timeStep, numberOfSteps);

