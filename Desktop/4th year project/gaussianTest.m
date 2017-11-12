numberOfParticles = 8;
numberOfSteps = 200;
timeStep = 1/200;
t = linspace(0,1,200);

B = [1,0,0,0,0,0,0,0; 0,0,0,0,1,0,0,0; 0,0,0,0,0,0,0,1; 0,1,0,0,0,0,0,0];
initial = randomIntializer(numberOfParticles);
v0 = initial{1};
u0 = initial{2};

opt = struct;
opt.p0 = v0;
opt.q0 = u0;

fullTrajectory = particleChainSimulation(timeStep, numberOfParticles, numberOfSteps, opt);
v = fullTrajectory{1};
u = fullTrajectory{2};

M = (B*transpose(B))^(-1);
p = zeros(numberOfSteps+1, 4);
q = zeros(numberOfSteps+1, 4);
for i = 1:numberOfSteps+1
    p(i,:) = B*transpose(v(i,:));
    q(i,:) = B*transpose(u(i,:));
end


%following code is to calculate the derivative of v
deriv = zeros(numberOfSteps, numberOfParticles);
for j = 1:numberOfSteps
    deriv(j,:) = (1/timeStep)*(v(j+1,:)-v(j,:));
end

test = zeros(1, 3);
for k = 1:numberOfSteps
    firstTerm = generateFirstTermFrom26(B, q(k,:), 4);
    test(k,:) = firstTerm - M*B*deriv(k,:);
end


