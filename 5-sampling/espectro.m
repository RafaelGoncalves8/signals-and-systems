%Essa fun��o plota o espectro do sinal y. S�o mostradas apenas as
%frequ�ncias positivas, j� que se assume que o sinal � real e, portanto,
%as frequ�ncias negativas s�o o conjugado das positivas. O eixo x mostra
%a frequ�ncia em rad/amostra.

function espectro(y)

Y = abs(fft(y));
w = linspace(0,2*pi,floor(length(y)));
Y = Y(1:(length(w)));
Y = Y./max(Y);
figure; plot(w,Y);
xlabel('\Omega (rad)')
ylabel('|Y(e^{j\Omega})|')
axis([0 2*pi 0 max(Y)]); grid;
