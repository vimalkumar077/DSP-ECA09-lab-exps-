clc;
clear;
close all;

%% Filter Specifications
Fs = 8000;          % Sampling Frequency (Hz)
Fp = 1000;          % Passband Frequency (Hz)
Fst = 3000;         % Stopband Frequency (Hz)
Rp = 1;             % Passband Ripple (dB)
Rs = 20;            % Stopband Attenuation (dB)

%% Normalize Frequencies
Wp = Fp/(Fs/2);     % Normalized Passband Frequency
Ws = Fst/(Fs/2);    % Normalized Stopband Frequency

%% Find Minimum Filter Order
[N, Wn] = buttord(Wp, Ws, Rp, Rs);

%% Design Butterworth Low-Pass Filter
[b, a] = butter(N, Wn, 'low');

%% Frequency Response
figure;
freqz(b, a);
title('Frequency Response of Butterworth LPF');

%% Impulse Response
figure;
impz(b, a, 50);
title('Impulse Response');

%% Step Response
figure;
stepz(b, a);
title('Step Response');

%% Pole-Zero Plot
figure;
zplane(b, a);
title('Pole-Zero Plot');

%% Display Filter Parameters
fprintf('\nButterworth Low-Pass Filter Design\n');
fprintf('----------------------------------\n');
fprintf('Sampling Frequency      = %d Hz\n', Fs);
fprintf('Passband Frequency      = %d Hz\n', Fp);
fprintf('Stopband Frequency      = %d Hz\n', Fst);
fprintf('Passband Ripple         = %d dB\n', Rp);
fprintf('Stopband Attenuation    = %d dB\n', Rs);
fprintf('Minimum Filter Order(N) = %d\n', N);
fprintf('Cutoff Frequency (Wn)   = %.4f\n', Wn);