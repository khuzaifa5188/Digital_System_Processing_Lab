% LAB 01 - Task 1
% Question: Generate Unit Sample, Unit Step, and Unit Ramp sequences.

n = -10:10; % Time index

% 1. Unit Sample Sequence (Delta Function)
unit_sample = [n == 0];

% 2. Unit Step Sequence
unit_step = [n >= 0];

% 3. Unit Ramp Sequence
unit_ramp = n .* (n >= 0);

% Plotting
figure;
subplot(3,1,1);
stem(n, unit_sample, 'filled');
title('Unit Sample Sequence \delta[n]');
grid on;

subplot(3,1,2);
stem(n, unit_step, 'filled');
title('Unit Step Sequence u[n]');
grid on;

subplot(3,1,3);
stem(n, unit_ramp, 'filled');
title('Unit Ramp Sequence r[n]');
xlabel('n (Samples)');
grid on;

% LAB 01 - Task 2
% Question: Generate Sawtooth and Square waves.

t = 0:0.01:1;
f = 5; % Frequency 5Hz

% 1. Sawtooth Wave
y_saw = sawtooth(2*pi*f*t);

% 2. Square Wave
y_sq = square(2*pi*f*t);

figure;
subplot(2,1,1);
plot(t, y_saw);
title('Sawtooth Wave');
grid on;

subplot(2,1,2);
plot(t, y_sq);
title('Square Wave');
xlabel('Time (sec)');
grid on;

% LAB 01 - Task 3
% Question: Analyze real, imag, magnitude, and phase of complex exponentials.

n = 0:20;
alpha = -0.1;
omega = 0.5;
x = exp((alpha + 1i*omega)*n);

figure;
subplot(2,2,1);
stem(n, real(x), 'filled');
title('Real Part');

subplot(2,2,2);
stem(n, imag(x), 'filled');
title('Imaginary Part');

subplot(2,2,3);
stem(n, abs(x), 'filled');
title('Magnitude');

subplot(2,2,4);
stem(n, angle(x), 'filled');
title('Phase (Radians)');

% LAB 01 - Task 4
% Question: Sinusoidal analysis and aliasing.

fs = 100; % Sampling frequency
t = 0:1/fs:0.1;
f = 10; % Signal frequency 10Hz
x = sin(2*pi*f*t);

figure;
plot(t, x, '-o');
title('Sinusoidal Signal Analysis');
xlabel('Time (sec)');
ylabel('Amplitude');
grid on;