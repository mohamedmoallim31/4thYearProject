function term2 = generateTerm2Of26(memoryKernel, p, stepSize, t)
    term2 = 0;
    
    %need to make sure j is a natural number
    %j is t, i is tau
    j = floor(t/stepSize);
    term2 =0.5*(memoryKernel{1}*p(1,:) + memoryKernel{j}*p(j,:));
    size = size(p);
    size = size(1);
    i = 0;
    while (j-i > 1) && (j-i < size)
         i = i + 1;
        term2 = term2 + memoryKernel{i}*p(j-i,:);
    end
    term2 = term2/stepSize;
end

