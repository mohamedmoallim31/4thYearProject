function [R] = generateR(B, numberOfParticlesInLatticeRow)
%GENERATER Summary of this function goes here
%   Detailed explanation goes here
    D = forceConstantMatrix(numberOfParticlesInLatticeRow);
    Dinv = pinv(D);
    transposeB = transpose(B);
    matrix = B*(Dinv*transposeB);
    R = Dinv*(transposeB/matrix);
end

