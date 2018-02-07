numberOfParticles = 8;
numberOfSteps = 200000;
timeStep = 1/200;
t = linspace(0,1,numberOfSteps);
B = [1,0,0,0,0,0,0,0; 0,0,0,0,1,0,0,0; 0,0,0,0,0,0,0,1];
sizeB = size(B);
numberOfCoarseGrainParticles = sizeB(1);

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
p = zeros(numberOfSteps+1, numberOfCoarseGrainParticles);
q = zeros(numberOfSteps+1, numberOfCoarseGrainParticles);
for i = 1:numberOfSteps+1
    p(i,:) = B*transpose(v(i,:));
    q(i,:) = B*transpose(u(i,:));
end


%following code is to calculate the derivative of v
deriv = zeros(numberOfSteps, numberOfParticles);
for j = 1:numberOfSteps
    deriv(j,:) = (1/timeStep)*(v(j+1,:)-v(j,:));
end

R = generateR(B, numberOfParticles);
test = zeros(1, numberOfCoarseGrainParticles);
for k = 1:numberOfSteps
    firstTerm = generateFirstTermFrom26(R, q(k,:), numberOfParticles);
    test(k,:) = transpose(firstTerm - M*B*transpose(deriv(k,:)));
end


%randomly generate a sample of the distribution along trajectory 
sampleSize = floor(numberOfSteps/100);

H_0 = 'H_0: The sample data are normally distributed with mean 0 and uknown s.d';
H_1 =  'H_1: The sample data are not normally distributed';

alpha = 0.01;
%constant for optimal bin sizing described in paper by Williams
c = norminv(alpha);
%optiml bin size described in paper by williams
numberOfBins = 4*floor(nthroot(2*(((sampleSize-1)^2)/c^2), 5));


sample = datasample(test(:,3), sampleSize);
%draw histogram
histogram(sample, numberOfBins);
%fit bell curve to data
histfit(sample);


degreesOfFreedom = sampleSize - 2;

disp(H_0);
disp(H_1);
fprintf('The significance level of this test is: alpha = %g\n', alpha);
fprintf('The degrees of freedom of this test is: degreesOfFreedom = %d\n', degreesOfFreedom);

sigma =  std(sample);
fprintf('The sample standard deviation of this test is sigma = %g\n', sigma);


%want probability of landing in a bin to be equal for all bins
probabilityOfLandingInBin = 1/numberOfBins;

zScore = zeros(numberOfBins-1,1);
currentProbability = 0;
for i = 1:numberOfBins-1
    currentProbability = currentProbability + probabilityOfLandingInBin;
    zScore(i) = norminv(currentProbability);
end

testScore = 0 + zScore.*sigma;
binEdges = [-inf, transpose(testScore), inf];

%finds frequency of elements in each bin
 x = discretize(sample, binEdges);
 observedFrequencies = zeros(length(binEdges)-1,1);
for i = 1:length(binEdges)-1
    observedFrequencies(i) = sum(x==i);
end

expectedFrequencyForEachBin = probabilityOfLandingInBin*sampleSize;
testStatistic = sum((observedFrequencies-expectedFrequencyForEachBin).^2)/expectedFrequencyForEachBin;

fprintf('The test statistic is %g\n', testStatistic);

valueToCompareAgainst = chi2inv(alpha, degreesOfFreedom);

fprintf('The value to compare against is %g\n ', valueToCompareAgainst);

if testStatistic < valueToCompareAgainst
    fprintf('We have failed to reject the null hypothesis\n');
else
    fprintf('We reject the null hypothesis and can conclude the distribution is not normal\n');
end



