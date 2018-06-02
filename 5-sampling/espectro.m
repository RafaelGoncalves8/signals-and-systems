%Essa função plota o espectro do sinal y. São mostradas apenas as
%frequências positivas, já que se assume que o sinal é real e, portanto,
%as frequências negativas são o conjugado das positivas. O eixo x mostra
%a frequência em rad/amostra.

function espectro(y)

Y = abs(fft(y));
w = linspace(0,2*pi,floor(length(y)));
Y = Y(1:(length(w)));
Y = Y./max(Y);
figure; plot(w,Y);
xlabel('\Omega (rad)')
ylabel('|Y(e^{j\Omega})|')
axis([0 2*pi 0 max(Y)]); grid;
