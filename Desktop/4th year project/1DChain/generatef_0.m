function [ f_0 ] = generatef_0(B, numberOfParticles,numberOfSteps,timeStep, u0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    eqU = zeros(numberOfParticles,1);
    eqU(1) = u0(1);
    for i = 2:numberOfParticles
        eqU(i) = eqU(i-1)+1;
    end
    
    C = solveForC(B, numberOfParticles, numberOfSteps, timeStep);
    
    f_0 = cell(numberOfSteps, 1);
    for j = 1:numberOfSteps
        f_0{j} = C{j}*eqU;
    end
end

