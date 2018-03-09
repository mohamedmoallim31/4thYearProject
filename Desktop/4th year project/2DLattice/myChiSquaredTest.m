function [ decision ] = myChiSquaredTest(sample, sampleSize)
    %randomly generate a sample of the distribution along trajectory 

    H_0 = 'H_0: The sample data are normally distributed with mean 0 and uknown s.d';
    H_1 =  'H_1: The sample data are not normally distributed';

    alpha = 0.01;
    %constant for optimal bin sizing described in paper by Williams
    %optiml bin size described in paper by williams
    numberOfBins = binNo(sampleSize, alpha);
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

end

