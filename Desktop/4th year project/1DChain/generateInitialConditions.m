%File will save intitial solution to xsl spreadsheet 
numberOfParticles = 8;
numberOfSteps = 2*1e7;
timeStep = 1/200;

tic
p = particleChainSimulation(timeStep, numberOfParticles, numberOfSteps);
toc

if exist('solutionp.xlsx', 'file')
    delete 'solutionp.xlsx';    
end

if exist('solutionq.xlsx', 'file')
    delete 'solutionq.xlsx';    
end

xlswrite('solutionp.xlsx', p{1}, 'p');
xlswrite('solutionq.xlsx', p{2}, 'q');