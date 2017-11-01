%function to generate matrix R

function R = generateR(B, numberOfParticles)
    %D is as defined on Li's paper
    D_0 = -2*114;
    D_mod1 = 114;
    D = full(gallery('tridiag', numberOfParticles, D_mod1,D_0,D_mod1));
    transposeB = transpose(B);
    matrix = B*(D\transposeB);
    if det(matrix) == 0
        error('cannot use the current B matrix for an approximation');
    else
        R = D\(transposeB/matrix);
    end
end