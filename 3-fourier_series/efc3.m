t = -2:0.0001:2;
T = 4;
a = @(k) (i*cos(k*pi))/(k*pi);
w0 = 2*pi/T;

% fourier approximation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ind = 1; % index for figure numbering
for n = [1, 10, 20, 50],
    figure(ind);
    X = plot_fourier(n, a, t, w0, 1);
    hold on
    plot(t, t/2, 'r')
    legend('x_n(t)', 'x(t)')
    ind = ind+1;
    Error = sum((t/2 - X).^2)/size(t)(2)
    hold off
end;

% plot |a_k| x w
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = -50:50;
w = k.*w0;
A = zeros(size(k));
for j = k,
    if j != 0,
        A(j+51) = abs(a(j));
    end;
end;
figure(ind)
ind = ind+1;
stem(w, A)
xlabel('w')
ylabel('|a_k|')

% plot abs and angle of frequency response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wc = 10;

H = [];
for b = w,
    if b != 0,
        H = [H 1/(1 - (10/b)*i)];
    else
        H = [H 0]
    end;
end;

figure(ind)
ind = ind+1;
stem(w, abs(H))
xlabel('w')
ylabel('|H(jw)|')

figure(ind)
ind = ind+1;
stem(w, angle(H))
xlabel('w')
ylabel('arg(H(jw))')

% plot LIT filter in the signal X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c = @(k) H(k +51)*a(k); % a_k multiplied by H(jw)

figure(ind);
Y = plot_fourier(50, c, t, w0, 1)
xlabel('t')
ylabel('y(t)')

input('>')
