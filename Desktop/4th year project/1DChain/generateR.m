%function to generate matrix R

function R = generateR(B, numberOfParticles)
    %D is as defined on Li's paper
    D_0 = -2*72;
    D_mod1 = 72;
    D = full(gallery('tridiag', numberOfParticles, D_mod1,D_0,D_mod1));
    D(1,1) = -72;
    D(numberOfParticles,numberOfParticles) = -72;
    D=-D;
    Dinv = pinv(D);
    transposeB = transpose(B);
    matrix = (B*Dinv*transposeB);
    R = (Dinv*transposeB)/matrix;
end