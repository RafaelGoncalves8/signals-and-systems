f0 = 3;
fs = 64;
N = 64;
x = @(n) sin(2*pi*f0/fs*n);
w = 0:pi/32:(pi-(pi/32));

% a)
Xn = [];
for n = 0:(N-1)
    Xn = [Xn; x(n)];
end

figure(1)
stem(Xn);
ylabel('x[n]');
xlabel('x');

% c)
Xk = fft(Xn, 64)
[Xejomega, W] = freqz(Xn, 1, 3200)
size(Xejomega)
figure(2)
plot(W, abs(Xejomega));
hold on
stem(w, abs(Xk(1:32)));
xticks(1:4:32)
xlabel("\\Omega")
legend("X(e^{j\\Omega})", "X(k)")
input('>');

% e)

f0 = 3.4;
fs = 64;
N = 64;
x = @(n) sin(2*pi*f0/fs*n);

Xn = [];
for n = 0:(N-1)
    Xn = [Xn; x(n)];
end

figure(3)
stem(Xn);
ylabel('x[n]');
xlabel('x');

input('>');

Xk = fft(Xn, 64)
[Xejomega, W] = freqz(Xn, 1, 3200)
figure(4)
plot(W, abs(Xejomega));
hold on
stem(w, abs(Xk(1:32)));
xticks(1:4:32)
xlabel("\\Omega")
legend("X(e^{j\\Omega})", "X(k)")

input('>');

