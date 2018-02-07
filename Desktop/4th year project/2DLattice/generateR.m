function [R] = generateR(B, numberOfParticlesInLatticeRow)
%GENERATER Summary of this function goes here
%   Detailed explanation goes here
    D = forceConstantMatrix(numberOfParticlesInLatticeRow);
    transposeB = transpose(B);
    matrix = B*(D\transposeB);
    R = D\(transposeB/matrix);
end

