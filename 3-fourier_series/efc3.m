t = -2:0.0001:2;
T = 4;
a = @(k) (i*cos(k*pi))/(k*pi);
w0 = 2*pi/T;

% fourier approximation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 1; % index for figure numbering
for n = [1, 10, 20, 50],
    figure(i);
    X = plot_fourier(n, a, t, w0, 1);
    hold on
    plot(t, t/2, 'r')
    legend('x_n(t)', 'x(t)')
    i = i+1;
    Error = sum((t/2 - X).^2)/size(t)(1)
    hold off
end;

% plot |a_k| x w
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = -50:50;
w = (2*pi).*k;
A = zeros(size(k));
for j = k,
    if j != 0,
        A(j+51) = abs(a(j));
    end;
end;
figure(i)
i = i+1;
stem(w, A)
xlabel('w')
ylabel('|a_k|')

% plot abs and angle of frequency response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w = -300:0.1:300
wc = 10;
h = @(w) 1/(1 - i*(wc/w));

H = [];
for j = w,
    H = [H h(j)];
end;

figure(i)
i = i+1;
plot(w, abs(H))
xlabel('w')
ylabel('|H(jw)|')

input('>')

figure(i)
i = i+1;
plot(w, angle(H))
xlabel('w')
ylabel('arg(H(jw))')

input('>')
