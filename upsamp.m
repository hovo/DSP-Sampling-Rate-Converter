% increases the sample rate of x by inserting n ? 1 zeros between samples.
function y = upsamp(x, n)
    j = 1;
    for i=1:length(x)
        y(j) = x(i);
        y = [y zeros(1, n-1)];
        j = j + n;
    end
end