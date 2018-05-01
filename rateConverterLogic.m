%{
 
   SAMPLING RATE CONVERTER: BLOCK DIAGRAM

           |----------------|     |-----|     |-----------------|
    ------>|  upsample by L |---->| LPF |---->| downsample by M |----->
           |________________|     |_____|     |_________________|
 
 This function performs sampling rate conversion
 x: audio signal E.g. output from audioread
 L: Integer factor for upsampling E.g 320
 M: Integer factor for downsampling E.g 441
 desiredFreq: Frequency we are trying to achive E.g. 32000 Hz 
 
 Example: resampling an audio file from 44100 Hz to 32000 Hz
          L/M = 32000/44100 = 320/441
          desiredFreq = 32000
%}
function rateConverterLogic(x, L, M, desiredFreq)
    % Upsample the origianl audio file by a factor of L
    upsampled_x = myUpsample(x, L);

    % Low pass filer with cutoff frequency: pi/M
    filter = LPF(M);

    % Convolve the filter with the upsampled signal
    interpolated_x = conv(upsampled_x, filter);

    % Downsample the interpolated signal by a factor of M
    downsampled_x = myDownsample(interpolated_x, M);

    % Accomadte for power loss: Multiply by constant gain factor of 100
    downsampled_x = downsampled_x.*100;

    % % Play the audio at desired frequency
    sound(downsampled_x, desiredFreq);
end
