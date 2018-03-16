function term2 = generateTerm2Of26(memoryKernel, p, stepSize, n, numberOfCoarseGrainParticles)
    term2 = zeros(numberOfCoarseGrainParticles,1);
    %need to make sure j is a natural number
    %j is t, i is tau
    if n <= 2
       return; 
    end
    sizeP = size(p,1);
    if sizeP>1 && n>1
         term2 =0.5*(memoryKernel{1}*transpose(p(n-1,:)) + memoryKernel{n-1}*transpose(p(1,:)));
    end
    
    for i = 2:n-2
        term2 = term2 + memoryKernel{i}*transpose(p(n-i,:));
    end
    
    term2 = term2*stepSize;
end

