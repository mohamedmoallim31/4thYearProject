%n is the number of particles in a row
n = 5;
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
numberOfSteps = 90000;
timeStep = 1/300;
[v0,u0] = randomInitilizer(n);

%calculate full trajectory
[v,u] = latticeSimulation(n,v0,u0, numberOfSteps, timeStep);

M = inv(B*transpose(B));
p = zeros(numberOfSteps+1, 2*numberOfCoarseGrainParticles);
q = zeros(numberOfSteps+1, 2*numberOfCoarseGrainParticles);
for i = 1:numberOfSteps+1
    p(i,:) = B*transpose(v{i});
    q(i,:) = B*transpose(u{i});
end

deriv = zeros(numberOfSteps, 2*numberOfCoarseGrainParticles);
for i = 1:numberOfSteps
    deriv(i,:) =(p(i+1,:)-p(i,:))/timeStep;
end

R = generateR(B, n);
test = zeros(1, 2*numberOfCoarseGrainParticles);

for k = 1:numberOfSteps
    firstTerm = generateFirstTermFrom26(R, B, q(k,:),n);
    test(k,:) = transpose(firstTerm + M*transpose(deriv(k,:))); 
end

sampleSize = floor(numberOfSteps/100);
significanceLevel = 0.10;
xsample = datasample(test(:,5), sampleSize);
ysample = datasample(test(:,6), sampleSize);
%draw histogram
ax1 = subplot(2,1,1);
histogram(xsample, binNo(sampleSize, significanceLevel));
%fit bell curve to data
title('\textbf{Histogram Of Sample For x positions}','Interpreter','latex')


ax2 = subplot(2,1,2);
histogram(ysample, binNo(sampleSize, significanceLevel));
%fit bell curve to data
title('\textbf{Histogram Of Sample For y positions}','Interpreter','latex')


myChiSquaredTest(xsample, sampleSize);
myChiSquaredTest(ysample, sampleSize);
