% Define the impulse response
h = [1, 1.5, 1];

% Calculate H(z) using FFT for frequency response
N = 64; % Number of points for FFT
H = fft(h, N);
k = 0:N-1;
w = 2*pi*k/N;

% Plot the pole-zero diagram
figure(1);
zplane(h);
title('Pole-Zero Diagram');

% Plot the frequency response (using stem for discrete values)
figure(2);
subplot(2,1,1);
stem(w, abs(H)); 
title('Magnitude Response');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
xticks([0 pi/2 pi 3*pi/2 2*pi]);
xticklabels({'0', '0.5\pi', '1\pi', '1.5\pi', '2\pi'});
grid on;
xlim([0 2*pi]);

subplot(2,1,2);
stem(w, angle(H));
title('Phase Response');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');
xticks([0 pi/2 pi 3*pi/2 2*pi]);
xticklabels({'0', '0.5\pi', '1\pi', '1.5\pi', '2\pi'});
grid on;
xlim([0 2*pi]);

% Test the filter with a sample signal
fs = 2000; % Sample rate 
t = 0:1/fs:0.1-1/fs; % Time vector (0.1 seconds)

% Create a test signal with multiple frequency components
f1 = 100; 
f2 = 300;
f3 = 700;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);

% Apply the filter using convolution
y = conv(x, h, 'same'); % 'same' returns the central part of the convolution

% Plot the original and filtered signals
figure(3);
subplot(2,1,1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, y); 
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% --- Frequency Spectrum Plots (Higher Resolution) ---

% Increase the number of points for FFT in frequency spectrum analysis
N_freq = 512;  % Higher value for better resolution

% Frequency Spectrum of Original Signal
X_freq = fft(x, N_freq);
f = fs*(0:(N_freq/2))/N_freq;

figure(4);
subplot(2,1,1);
stem(f, abs(X_freq(1:length(f)))); % Use stem for discrete values
title('Frequency Spectrum of Original Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Frequency Spectrum of Filtered Signal
Y_freq = fft(y, N_freq); % Use the filtered signal 'y'
f = fs*(0:(N_freq/2))/N_freq;

subplot(2,1,2);
stem(f, abs(Y_freq(1:length(f)))); % Use stem for discrete values
title('Frequency Spectrum of Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
