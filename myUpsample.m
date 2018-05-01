%{
 This function increases the sampling rate of x by inserting n-1 zeros
 between each sample.

 Example: x = [1,2,3,4];
          n = 2;
          myUpsample(x,2) will return: [1,0,2,0,3,0,4]
%}
function y = myUpsample(x, n)
    j = 1;
    for i=1:length(x)
        y(j) = x(i);
        y = [y zeros(1, n-1)];
        j = j + n;
    end
end