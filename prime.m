function pr=prime(m,n)
%prime determines the prime numbers from m to n
% Inputs:
%   m - a positive integar
%   n - a positive integar greater than m
% Outputs:
%   pr - an array of all the prime numbers between m and n
if n<=0 || m<=0;
    error('The input argument must be a positive integer.');
elseif n<=m ;
    error('The value of n must be larger than the value of m.');
end;
x=1;
pr=[];
if m<=2;
    pr(1,1)=(2);
    x=2
end;
while m<=n;
    for i=2:(m-1);
        if rem(m,i)==0;
            break;
        elseif i==(m-1);
            pr(1,x)=(m);
            x=x+1;
        end;
    end;
    m=m+1;    
end;





    