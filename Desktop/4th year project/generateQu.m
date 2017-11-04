function Qu = generateQu(B, numberOfParticles)
    Identity = eye(numberOfParticles);
    Pu = generatePu(B, numberOfParticles);
    Qu = Identity - Pu;
end

