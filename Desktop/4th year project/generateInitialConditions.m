%File will save intitial solution to xsl spreadsheet 
numberOfParticles = 8;
numberOfSteps = 20;
timeStep = 1/200;

p = particleChainSimulation(timeStep, numberOfParticles, numberOfSteps);

delete 'solution.xlsx';
xlswrite('solution.xlsx', p{1}, 'p');
xlswrite('solution.xlsx', p{2}, 'q');