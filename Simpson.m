function I = Simpson(x,y)
%The Simpson function is used to calculate the integral of a function
%across a set of truncated data points. 
%   The input values are 'x', a vector of the x values, and 'y', a vector of 
%   the y values. The output is "I", which is the integral value calulated
%   with the simpsons rule. If the number of intervals is odd, a single
%   trapiziodal rule will be applied. 

% Length of vector error
if length(y) ~= length(x)
    error("Inputs x and y must be the same length")
end

% Vector spacing (only if spacing is not the same), assign h value
spacing = diff(x);
if ~ all(spacing == spacing(1))
    error("Inputs must have equal spacing to run fuction")
else 
    h = spacing(1);
end

% Intervals (deterine if trapiziodal method must be used for odd number of
% invervals)
n = length(x)-1;
if mod(n,2) ~= 0
    warning("Trapiziodal rule will be used to calculate last interval due to an odd number of intervals")
    ySimpsons = y(1:end-1);
    yTraprule = y(end-1:end);
else
    ySimpsons = y;
    yTraprule = [];
end

% Formulas for Simpon's and Trapizoidal Rule
ISimpsons = (h/3)*(ySimpsons(1)+2*sum(ySimpsons(3:2:end-2))+4*sum(ySimpsons(2:2:end))+ySimpsons(end));
ITraprule = (h/2)*(sum(yTraprule));
I = ISimpsons + ITraprule;

end

