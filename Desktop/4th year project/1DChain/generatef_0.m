function [ f_0 ] = generatef_0(B, numberOfParticles,numberOfSteps,timeStep)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    eqU = [1:numberOfParticles;]';
    
    [C, S] = solveForCS(B, numberOfParticles, numberOfSteps, timeStep);
    
    f_0 = cell(numberOfSteps, 1);
    for j = 1:numberOfSteps
        f_0{j} = C{j}*eqU;
    end
end

