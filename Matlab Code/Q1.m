N = 32; % Number of points, bigger for clarity
x = [ones(1,10), zeros(1,N-10)];

% Calculate DFT
X = fft(x);

% Calculate frequency axis (in pi notation)
k = 0:N-1;
w = (k/N)*2;

% Plot the magnitude spectrum
figure(1);
stem(w, abs(X), 'filled');
xlabel('Frequency (\omega/\pi)');
ylabel('|X(\omega)|');
title('Magnitude Spectrum');
xlim([0 2]);
xticks(0:0.5:2);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
grid on;

% Plot the phase spectrum
figure(2);
stem(w, angle(X), 'filled');
xlabel('Frequency (\omega/\pi)');
ylabel('∠X(\omega)');
title('Phase Spectrum');
xlim([0 2]);
xticks(0:0.5:2);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
grid on;

% Reconstruct the signal using ifft
x_reconstructed = ifft(X);

% Plot original and reconstructed signals (only the first 10 points)
figure(3);
subplot(2,1,1);
stem(1:10, x(1:10), 'filled');
title('Original Signal');
xlabel('n');
ylabel('x[n]');
ylim([0 1.2]);
grid on;

subplot(2,1,2);
stem(1:10, x_reconstructed(1:10), 'filled');
title('Reconstructed Signal');
xlabel('n');
ylabel('x[n]');
ylim([0 1.2]);
grid on;