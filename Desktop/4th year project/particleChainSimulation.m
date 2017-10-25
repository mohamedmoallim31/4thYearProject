%Approximation of particle chain using lennard jones potential in the
%interval 

h = 1/200;
p_0 = 2.*transpose(rand(32,1))-1;
q_0 = rand;

for i=1:31
    q_0(i + 1) = q_0(i) + 1 - (rand/100);
end

phi_q_0 = zeros(1,32);

for i = 1:32;
    phi_q_0(i) = phi(q_0(i));
end

%p is used to store all solutions
%p_step_new is used to calculate the solution at step n
%p_step_old is used to load up old value

%taking m = 1
p = p_0;
q = q_0;
q_step_new = [];
p_step_new = [];
p_step_old = p_0;
q_step_old = q_0;


%iterate for 100 steps
for n=1:1000
    p_halfstep_1 = p_step_old(1)+(h/2)*(deriv_phi(q_step_old(2)-q_step_old(1)));
    q_step_new(1) = q_step_old(1) + h*p_halfstep_1;
    p_step_new(1) = p_halfstep_1 + (h/2)*(deriv_phi(q_step_old(2)-q_step_old(1)));
    for i=2:31
        p_halfstep_i = p_step_old(i)+(h/2)*(deriv_phi(q_step_old(i+1)-q_step_old(i))-deriv_phi(q_step_old(i)-q_step_old(i-1)));
        q_step_new(i) = q_step_old(i) + h*p_halfstep_i;
        p_step_new(i) = p_halfstep_i + (h/2)*(deriv_phi(q_step_old(i+1)-q_step_old(i))-deriv_phi(q_step_old(i)-q_step_old(i-1)));
    end
    p_halfstep_32 = p_step_old(32)-(h/2)*(deriv_phi(q_step_old(32)-q_step_old(31)));
    q_step_new(32) = q_step_old(32) + h*p_halfstep_32;
    p_step_new(32) = p_halfstep_32-(h/2)*(deriv_phi(q_step_old(32)-q_step_old(31)));
    p_step_old = p_step_new;
    q_step_old = q_step_new;
    p = [p; p_step_new];
    q = [q; q_step_new];
end

t = linspace(0,1,1001);
plot(t, p);


