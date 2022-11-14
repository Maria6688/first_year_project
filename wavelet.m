% Proof of concept

%add path
app_path = '/Users/Sablab/Desktop/Maria/Masters/mas_alpha_blocking/Mas001_2/Mas001_2.f.ses.app1';

%set parameters
f0start = 16;
f0end = 160;
fdelta = 5;
refelec = 29;%double check what refelec is doing purpose
%run wavelet
[WaPower] = wavelet_app_dft(app_path, f0start, f0end, fdelta, refelec);
%draw fig
%figure,contourf(squeeze(WaPower(refelec,:,:))),colorbar
start_time_ms = -3000;
end_time_ms = 2000;
sample_rate = 512;
taxis = start_time_ms:1000/sample_rate:end_time_ms;
time_between_samples = 1000/sample_rate;
number_of_samples = size(WaPower,2);
%freq_interval = number_of_samples/time_between_samples;
number_of_ms_in_a_sec = 1000
freq_interval = number_of_ms_ina_sec/(number_of_samples*time_between_samples)
nyquist_frequency = sample_rate/2;
freqaxistotal = 0:freq_interval:nyquist_frequency; 
faxis = freqaxistotal(f0start:fdelta:f0end);
figure,contourf(taxis,faxis,squeeze(WaPower(refelec,:,:))'),colorbar;
%draw bassline correction fig
bslcorrwamat = bslcorrWAMat(WaPower, 5:512);
channel_Oz = 29
channel_Pz = 31
figure, contourf(taxis, faxis, squeeze(bslcorrwamat(channel_Pz, :, :))'), colorbar


%input batch files 
fid = importdata('/Users/Sablab/Desktop/Maria/Masters/mas_alpha_blocking/mac_appcat.txt')

% could put this in for loop
for index = 1:size(fid,1)
    [WaPower] = wavelet_app_dft(fid{index,:}, f0start, f0end, fdelta, channel_Oz);
    bslcorrwamat = bslcorrWAMat(WaPower, 5:512);
    %either add 3rd dimension or average frequencies from 8-12hz so only
    %one vector
    alpha_band = bslcorrwamat(channel_Oz,:,(6:10));
    cat_averages(index,:) =  mean(alpha_band,3)
end

