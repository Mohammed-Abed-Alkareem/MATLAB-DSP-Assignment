% Define the signals
x = [0, 0.3, 0.6, 0.8, 1];
h = [0.5, 1, 0.5];

% Zero-pad to the same length
N = length(x) + length(h) - 1;
x_padded = [x, zeros(1, N - length(x))];
h_padded = [h, zeros(1, N - length(h))];

% Calculate the DFTs
X = fft(x_padded);
H = fft(h_padded);

% Element-wise multiplication of DFTs
Y = X .* H;

% Inverse DFT to return to the time domain
y_dft = ifft(Y);

% Calculate the convolution of x[n] and h[n]
y_conv = conv(x, h);

% Display the results
disp('Result from Inverse DFT of Product of DFTs:');
disp(y_dft);
disp('Result from Convolution:');
disp(y_conv);

% Plot the results
figure;
subplot(2,1,1);
stem(0:length(y_dft)-1, y_dft);
title('Inverse DFT of Product of DFTs');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(2,1,2);
stem(0:length(y_conv)-1, y_conv);
title('Convolution of x[n] and h[n]');
xlabel('n');
ylabel('y[n]');
grid on;