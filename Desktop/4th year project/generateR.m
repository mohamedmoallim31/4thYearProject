%function to generate matrix R

function R = generateR(B, numberOfParticles)
    %D is as defined on Li's paper
    D_0 = -2*72;
    D_mod1 = 72;
    D = -full(gallery('tridiag', numberOfParticles, D_mod1,D_0,D_mod1));
    transposeB = transpose(B);
    matrix = B*(D^-1)*transposeB;
    R = D\(transposeB/matrix);
end