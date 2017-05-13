%Final Homework | CPS5310 | Spring 2017
%Submitted by Mirza Mohammad Maqbule Elahi
%Please run this matlab file "elahi" which compares 
%the solution obtained from the conjugate gradient (elahi_cg)
%method against the solution we obtain from using the MATLAB's 
%direct inversion command i.e, A\b or inv(A)* b.


%%
clear all;
close all;
clc;

%%%%%Input Param%%%%%%%%%%%%%%%%%%%%%
N = input('Enter the value of K = ');
K = N;
N = K^2;  %matrix size
h = 1/K;  %mesh size

%%%%Generating Matrices A,x,b%%%%%%%
A = zeros(N,N); 
x = zeros(N,1);  
b = zeros(N,1);  

%%%%Solving the Linear System%%%%%%%%%%%%%%%%%%%%%%
for i=1:N
    for j=1:N
       
        if(i==j)
            A(i,j)=(4/h^2);
        end
        
         if(abs(i-j)==K)
            A(i,j)=-1/h^2;
         end
        
        if(abs(i-j)==1 && (floor(i/K)==floor(j/K)))
          A(i,j)= (-1/h^2); 
        end
        
       
        
    end
end


for i=1:N
    b(i)=1;
end
 
x = A\b; %direct inversion method

y=elahi_cg(A,b,x); %conjugate gradient solver

enorm=norm(x-y,2) %finding euclidean norm

%%%%Plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(x);
xlabel('Grid Values');
ylabel('Solution of x');
title('Plot of x');