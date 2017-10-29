%Approximation of particle chain using lennard jones potential in the
%interval 

function answer = particleChainSimulation(timeStep, numberOfParticles, numberOfSteps, opt)
    if nargin < 3
        error('too few parameters');
    elseif nargin == 3    
        randomInitials = randomIntializer(numberOfParticles);
        p0 = randomInitials{1};
        q0 = randomInitials{2};
    else 
        randomInitials = randomIntializer(numberOfParticles);
        if ~isfield(opt, 'p0') && ~isfield(opt, 'p0')
            p0 = randomInitials{1};
            q0 = randomInitials{2};
        elseif ~isfield(opt, 'p0')
            p0 = randomInitials{1};
            q0 = opt.q0;
        elseif ~isfield(opt, 'q0')
            p0 = opt.p0;
            q0 = randomInitials{2};
        else
            p0 = opt.p0;
            q0 = opt.q0;
        end
    end 
    
    phi_q0 = zeros(1,numberOfParticles);
    for i = 1:numberOfParticles;
        phi_q0(i) = phi(q0(i));
    end

    %p is used to store all solutions
    %p_step_new is used to calculate the solution at step n
    %p_step_old is used to load up old value

    %taking m = 1
    p = p0;
    q = q0;
    qStepNew = [];
    pStepNew = [];
    pStepOld = p0;
    qStepOld = q0;


    for n=1:numberOfSteps
        pHalfStep1 = pStepOld(1)+(timeStep/2)*(deriv_phi(qStepOld(2)-qStepOld(1)));
        qStepNew(1)= qStepOld(1) + timeStep*pHalfStep1;
        pStepNew(1) = pHalfStep1 + (timeStep/2)*(deriv_phi(qStepOld(2)-qStepOld(1)));
        for i=2:numberOfParticles-1
            pHalfStepi = pStepOld(i)+(timeStep/2)*(deriv_phi(qStepOld(i+1)-qStepOld(i))-deriv_phi(qStepOld(i)-qStepOld(i-1)));
            qStepNew(i) = qStepOld(i) + timeStep*pHalfStepi;
            pStepNew(i) = pHalfStepi + (timeStep/2)*(deriv_phi(qStepOld(i+1)-qStepOld(i))-deriv_phi(qStepOld(i)-qStepOld(i-1)));
        end
        pHalfStepLast = pStepOld(numberOfParticles)-(timeStep/2)*(deriv_phi(qStepOld(numberOfParticles)-qStepOld(numberOfParticles-1)));
        qStepNew(numberOfParticles) = qStepOld(numberOfParticles) + timeStep*pHalfStepLast;
        pStepNew(numberOfParticles) = pHalfStepLast-(timeStep/2)*(deriv_phi(qStepOld(numberOfParticles)-qStepOld(numberOfParticles-1)));
        pStepOld = pStepNew;
        qStepOld = qStepNew;
        p = [p; pStepNew];
        q = [q; qStepNew];
    end
    
    t = linspace(0,1,numberOfSteps+1);
    if nargin == 3
        answer = {p,q};
        plot(t, p);
    elseif nargin > 3
        if ~isfield(opt, 'observableP') && ~isfield(opt, 'observableQ')
            answer = {p,q};
            plot(t, p);
        elseif ~isfield(opt, 'observableP') && isfield(opt, 'observableQ')
            for i = 1:numberOfSteps
                q(i,:) = opt.observableQ(q(i,:));
            end
            plot(t, q);
            answer = {p,q};
        elseif isfield(opt, 'observableP') && ~isfield(opt, 'observableQ')
            for i = 1:numberOfSteps
                p(i,:) = opt.observableP(p(i,:));
            end
            plot(t, p); 
            answer = {p,q};
        elseif isfield(opt, 'observableP') && isfield(opt, 'observableQ')
            for i = 1:numberOfSteps
                p(i,:) = opt.observableP(p(i,:));
                q(i,:) = opt.observableQ(q(i,:));
            end
            plot(t, p); 
            answer = {p,q};
        end 
    end
end 


