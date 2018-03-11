function term2 = generateTerm2Of26(memoryKernel, p, stepSize, t, numberOfCoarseGrainParticles)
    term2 = zeros(numberOfCoarseGrainParticles,1);
    %need to make sure j is a natural number
    %j is t, i is tau
    sizeP = size(p);
    sizeP = sizeP(1);
    j = floor(t/stepSize);
    if sizeP>1 && j>1
         term2 =0.5*(memoryKernel{j}*transpose(p(1,:)) + memoryKernel{1}*transpose(p(j-1,:)));
    end
    
    i = 0;
    while (j-i > 1) && (j-i < sizeP)
        i = i + 1;
        term2 = term2 + memoryKernel{i}*p(j-i,:);
    end
    term2 = term2*stepSize;
end

