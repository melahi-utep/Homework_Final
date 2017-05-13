%Final Homework | CPS5310 | Spring 2017
%Submitted by Mirza Mohammad Maqbule Elahi
%The function elahi_cg is a conjugate gradient solver 
%which uses the algorithm provided in the Homework instruction

function x = elahi_cg(A, b, x)
    r   = b - A * x;
    p   = r;
    ro  = r' * r;
    u   = x;
    tol = 1e-7;  %tolerance
    
max_iter=1100;

        for i = 1:max_iter
            a      = A * p;
            alpha  = ro / (a' * p);
            u      = u + alpha * p;
            r      = r - alpha * a;
            ro_new = r' * r;
            if sqrt(ro_new) < tol
            max_iter
            x=u;
            break
            end
                p = r + (ro_new / ro) * p;
                ro = ro_new;
                max_iter
                x = u;
        end
  
end