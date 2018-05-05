function Tn = calcula_coeficientes(w,wc,n)

%Rotina que calcula os coeficientes do polinômio de Chebyshev de maneira
%não recursiva.

%Parâmetros:
            %w: vetor de frequências (sugestão: usar um vetor com amostras
                %de 0 a 20rad/s. 1000 amostras já são suficientes).
            % wc = frequência de corte do filtro (em rad/s).
            % n = ordem do filtro de Chebyshev.
            
%Valor retornado: Tn: vetor com os coeficientes calculados do polinômio de
%Chebyshev (este vetor terá o mesmo tamanho que o vetor de frequecias w).

Tn(abs(w)<wc) = cos(n.*acos(w(abs(w)<wc)./wc));
Tn(abs(w)>=wc) = cosh(n.*acosh(w(abs(w)>=wc)./wc));

end