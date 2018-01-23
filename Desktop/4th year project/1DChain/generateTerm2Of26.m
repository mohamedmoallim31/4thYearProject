function term2 = generateTerm2Of26(memoryKernel, p, stepSize, t)
    term2 = 0;
    
    %need to make sure j is a natural number
    %j is t, i is tau
    j = floor(t/stepSize);
    term2 =0.5*(memoryKernel{j}*p(1,:) + memoryKernel{1}*p(j,:));
    sizeP = size(p);
    sizeP = sizeP(1);
    i = 0;
    while (j-i > 1) && (j-i < sizeP)
        i = i + 1;
        term2 = term2 + memoryKernel{i}*p(j-i,:);
    end
    if(sizeP <= 1)
        term2 = 0;
    else 
        term2 = term2*stepSize;
    end
end

