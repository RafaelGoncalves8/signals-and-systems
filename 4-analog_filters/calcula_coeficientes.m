function Tn = calcula_coeficientes(w,wc,n)

%Rotina que calcula os coeficientes do polin�mio de Chebyshev de maneira
%n�o recursiva.

%Par�metros:
            %w: vetor de frequ�ncias (sugest�o: usar um vetor com amostras
                %de 0 a 20rad/s. 1000 amostras j� s�o suficientes).
            % wc = frequ�ncia de corte do filtro (em rad/s).
            % n = ordem do filtro de Chebyshev.
            
%Valor retornado: Tn: vetor com os coeficientes calculados do polin�mio de
%Chebyshev (este vetor ter� o mesmo tamanho que o vetor de frequecias w).

Tn(abs(w)<wc) = cos(n.*acos(w(abs(w)<wc)./wc));
Tn(abs(w)>=wc) = cosh(n.*acosh(w(abs(w)>=wc)./wc));

end