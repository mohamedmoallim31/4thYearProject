%File will save intitial solution to xsl spreadsheet 
numberOfParticles = 8;
numberOfSteps = 1e3;
timeStep = 1/1000;

p = particleChainSimulation(timeStep, numberOfParticles, numberOfSteps);

filename = 'solution.xlsx';
xlswrite(filename, p{1});