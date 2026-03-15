% LAB 02 - Task 1
% Question: Compute FFT for a finite sequence.

x1 = [4, 3, 2, 1, 1, 2, 3, 4];
N = length(x1);
X1 = fft(x1);

% Compute frequency axis
f = (0:N-1)*(1/N);

figure;
stem(f, abs(X1), 'filled');
title('Task 1: Magnitude Spectrum using FFT');
xlabel('Normalized Frequency');
ylabel('|X(f)|');
grid on;

% LAB 02 - Task 2
% Question: Plot DTFT for x(n) = 3(0.9)^n u(n)

w = -pi:0.01:pi; % Frequency range
% Analytical formula: X(w) = 3 / (1 - 0.9*exp(-j*w))
X2 = 3 ./ (1 - 0.9*exp(-1i*w));

figure;
subplot(2,1,1);
plot(w/pi, abs(X2));
title('Task 2: DTFT Magnitude Response');
ylabel('Magnitude');
grid on;

subplot(2,1,2);
plot(w/pi, angle(X2));
title('Task 2: DTFT Phase Response');
xlabel('Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

% LAB 02 - Task 3
% Question: Frequency response from difference equation.
% H(w) = (2 + exp(-jw)) / (1 + 0.25exp(-jw) - 0.25exp(-2jw))

w = -pi:0.01:pi;
num_H = 2 + exp(-1i*w);
den_H = 1 + 0.25*exp(-1i*w) - 0.25*exp(-2*1i*w);
H_w = num_H ./ den_H;

figure;
plot(w/pi, abs(H_w));
title('Task 3: Frequency Response H(\omega)');
xlabel('Frequency (\times\pi rad/sample)');
ylabel('|H(\omega)|');
grid on;

% LAB 02 - Task 4
% Question: Compare manual DTFT with freqz command.

% Coefficients from the difference equation
b = [2, 1];           % Numerator coefficients
a = [1, 0.25, -0.25]; % Denominator coefficients

[H_builtin, w_builtin] = freqz(b, a, 512);

figure;
plot(w_builtin/pi, abs(H_builtin), 'LineWidth', 2);
hold on;
% Plot manual version for comparison (re-calculating for same range)
H_manual = (2 + exp(-1i*w_builtin)) ./ (1 + 0.25*exp(-1i*w_builtin) - 0.25*exp(-2*1i*w_builtin));
plot(w_builtin/pi, abs(H_manual), '--r');

legend('Built-in (freqz)', 'Manual Calculation');
title('Task 4: Comparison of freqz vs Manual DTFT');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;