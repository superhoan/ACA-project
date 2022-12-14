function sigma = bandG(D, nei)
% Compute the bandwidth of the Gauss kernel.
%
% Input
%   D       -  distance matrix, n1 x n2
%   nei     -  #nearest neighbour
%              0: binary kernel
%              NaN: set bandwidth to 1
%
% Output
%   sigma   -  kernel bandwidth
%
    if isnan(nei)
        sigma = 1;
        return;
    end
    
    if nei == 0
        sigma = 0;
        return;
    end
    
    n = size(D, 1);
    m = min(max(1, floor(n * nei)), n);
    
    Dsorted = sort(D);
    D2 = Dsorted(1 : m, :);
    sigma = sum(sum(D2, 1)) / (n * m);
end