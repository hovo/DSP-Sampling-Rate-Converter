%{
 This function decreases the sampling rate of x by keeping the first sample
 and then every nth sample after the first.
 
 Example: x = [1,2,3,4];
          n = 2;
          myDownsample(x, n) will return [1, 3]
%}
function y = myDownsample(x, n)
    y = x(1:n:length(x));
end