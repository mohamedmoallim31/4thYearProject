function [ f_0 ] = generatef_0(B, numberOfParticles,numberOfSteps,timeStep, u0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    eqV = zeros(numberOfParticles,1);
    eqU = zeros(numberOfParticles,1);
    eqU(1) = u0(1);
    for i = 2:numberOfParticles
        eqU(i) = eqU(i)+1;
    end
    
    C = solveForC(B, numberOfParticles, numberOfSteps, timeStep);
    S = solveForS(B, numberOfParticles, numberOfSteps, timeStep);
    
    f_0 = cell(numberOfSteps, 1);
    for j = 1:numberOfSteps
        f_0{j} = C{j}*(eqU) + S{j}*(eqV);
    end
end

