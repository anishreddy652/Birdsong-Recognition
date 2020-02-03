%Need to get the main frequency


[data, fs]=audioread('buzzjc.wav');
player = audioplayer(data,fs);
play(player);
dt = 1/fs;  % Sampling time [s]
t = 0:dt:1;  % Time
N = length(data);
f = (1:N/2+1)*fs/N;  % Frequency
clip = 205;  % Clip size (number of points)
X = zeros(clip, length(data)-clip);  % Clips matrix
Y = zeros(length(f), length(data)-clip);  % Spectrogram
for i = 1:length(data)-clip
    X(:,i) = data(i:i+clip-1);
    tmpS = fft(X(:,i), N);
    Y(:,i) = abs(tmpS(1:N/2+1));
end
imagesc(t, f, (Y))
title('Spectrogram of Hidden words');
xlabel('Time [s]')
ylabel('Frequency [Hz]')
beginFreq = 800 / (fs/2);
endFreq = 900 / (fs/2);
[b,a] = butter(6, (beginFreq/endFreq/2));
fOut = filtfilt(b, a, f);
p = audioplayer(fOut, fs);
p.play;
