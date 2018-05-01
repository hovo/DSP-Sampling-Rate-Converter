%{
 This function performs Interpolation by zero-padding in the frequancy
 domain; uses FFT and IFFT.

 Example: x = [1,2,3,4]
          n = 2;
          interpolate(x, n) will return 
          [1, 1291/1189, 2, 5/2, 3, 1597/408, 4, 5/2]
%}
function out = interpolate(x, n)
    % represent x as column-vector
    x = x(:);

    % number of unique fft points
    NUP = ceil((length(x)+1)/2);

    % FFT
    X = fft(x(:));

    % calculate the number of the padding zeros
    zerolen = round(length(x)*(n-1));

    % form a new spectrum
    Xhat = [X(1:NUP); zeros(zerolen, 1); X(NUP+1:end)];

    % IFFT
    out = real(ifft(Xhat));

    % correction of the amplitude
    out = out*n;
end