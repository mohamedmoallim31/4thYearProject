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
    p = zeros(numberOfSteps+1, numberOfParticles);
    q = zeros(numberOfSteps+1, numberOfParticles);
    p(1,:) = p0;
    q(1,:) = q0;
    qStepNew = zeros(numberOfParticles,1);
    pStepNew = zeros(numberOfParticles,1);
    pHalfStep = zeros(numberOfParticles,1);
    pStepOld = p0;
    qStepOld = q0;
    for n=1:numberOfSteps+1        
        pHalfStep(1) = pStepOld(1)+(timeStep/2)*(deriv_phi(qStepOld(2)-qStepOld(1)));
        for i=2:numberOfParticles-1
            pHalfStep(i) = pStepOld(i)+(timeStep/2)*(deriv_phi(qStepOld(i+1)-qStepOld(i))-deriv_phi(qStepOld(i)-qStepOld(i-1)));
        end
        pHalfStep(numberOfParticles) = pStepOld(numberOfParticles)-(timeStep/2)*(deriv_phi(qStepOld(numberOfParticles)-qStepOld(numberOfParticles-1)));

        
        qStepNew(1)= qStepOld(1) + timeStep*pHalfStep(1);
        for i=2:numberOfParticles-1
            qStepNew(i) = qStepOld(i) + timeStep*pHalfStep(i);
        end
        qStepNew(numberOfParticles) = qStepOld(numberOfParticles) + timeStep*pHalfStep(numberOfParticles);
        
                
        pStepNew(1) = pHalfStep(1) + (timeStep/2)*(deriv_phi(qStepNew(2)-qStepNew(1)));
        for i=2:numberOfParticles-1
            pStepNew(i) = pHalfStep(i) + (timeStep/2)*(deriv_phi(qStepNew(i+1)-qStepNew(i))-deriv_phi(qStepNew(i)-qStepNew(i-1)));
        end
        pStepNew(numberOfParticles) = pHalfStep(numberOfParticles)-(timeStep/2)*(deriv_phi(qStepNew(numberOfParticles)-qStepNew(numberOfParticles-1)));
        
        pStepOld = pStepNew;
        qStepOld = qStepNew;
        p(n,:) = pStepNew;
        q(n,:) = qStepNew;
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
            for j = 1:numberOfSteps+1
                q(j,:) = opt.observableQ(q(j,:));
            end
            plot(t, q);
            answer = {p,q};
        elseif isfield(opt, 'observableP') && ~isfield(opt, 'observableQ')
            for j = 1:numberOfSteps+1
                p(j,:) = opt.observableP(p(j,:));
            end
            plot(t, p); 
            answer = {p,q};
        elseif isfield(opt, 'observableP') && isfield(opt, 'observableQ')
            for j = 1:numberOfSteps+1
                p(j,:) = opt.observableP(p(j,:));
                q(j,:) = opt.observableQ(q(j,:));
            end
            plot(t, p); 
            answer = {p,q};
        end 
    end
end 


