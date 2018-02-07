function [Pu] = generatePu(B, numberOfParticlesInLatticeRow)
%GENERATE Summary of this function goes here
%   Detailed explanation goes here
    R = generateR(B, numberOfParticlesInLatticeRow);
    Pu = R*B;
end

