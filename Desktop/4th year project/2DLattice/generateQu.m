function [Qu] = generateQu(B, numberOfParticlesInLatticeRow)
%GENERATEQU Summary of this function goes here
%   Detailed explanation goes here
    Pu = generatePu(B, numberOfParticlesInLatticeRow);
    Identity = eye(2*numberOfParticlesInLatticeRow^2);
    Qu = Identity-Pu;
end

