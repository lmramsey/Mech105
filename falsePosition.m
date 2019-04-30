function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
% "falsePosition" is an algoritom created to estimate the root of a given
% function using the false positon method.
%   The inputs are: func (the function being evaluated), xl (the lower
%   guess), xu (the upper guess), es (the desired relative error (should
%   default to 0.0001%)), and maxiter (the number of iterations desired
%   (should default to 200)). The outputs are: root (the estimated root
%   location), fx (the function evaluated at the root location), ea (the
%   approximate relative error (%)), iter (how many iterations were
%   performed).

% Number of arguments erorr and argument defaults:

if nargin==3
    es = 0.0001;
    maxiter = 200;
elseif nargin==4
    maxiter = 200;    
elseif nargin>5
    disp('Error, too many inputs entered');
end


%Root Output, ea Output, iter Output:
ea = 100;
iter = 0;
if (func(xu)*func(xl))>0
    disp('error, no root')
else
    while iter<maxiter
        previousroot = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
        if sign(previousroot)==sign(xu)
            xl = previousroot;
        elseif sign(previousroot)==sign(xl)
            xu = previousroot;
        end
        currentroot = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
        ea = ((currentroot - previousroot)/currentroot)*100;
        iter = iter+1;
        if ea<es
            break 
        end
    end
end
root = currentroot;

%fx Output:
fx = func(root);
end

