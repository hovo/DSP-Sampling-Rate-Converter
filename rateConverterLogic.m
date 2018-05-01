function rateConverterLogic(x, L, M, desired)
    % 
    % % Read the audio signal
    % [x, Fs] = audioread('DSP.wav');

    % % Temp Variables
    % L = 320;
    % M = 441;
    % desired = 32000;

    %{
      SAMPLING RATE CONVERTER: BLOCK DIAGRAM

           |----------------|     |-----|     |-----------------|
    ------>|  upsample by L |---->| LPF |---->| downsample by M |----->
           |________________|     |_____|     |_________________|
    %}

    % Upsample the origianl audio file by a factor of L
    upsampled_x = myUpsample(x, L);

    % Low pass filer with cutoff frequency: pi/M
    filter = LPF(M);

    % Convolve the filter with the upsampled signal
    interpolated_x = conv(upsampled_x, filter);

    % Downsample the interpolated signal by a factor of M
    downsampled_x = myDownsample(interpolated_x, M);

    % Accomadte for power loss
    downsampled_x = downsampled_x.*100;

    % % Play the audio at desired frequency
    sound(downsampled_x, desired);
end
