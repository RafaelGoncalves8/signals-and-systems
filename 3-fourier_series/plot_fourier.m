function X = plot_fourier(N, a, t, w0, plot_var),
    X = zeros(size(t));
    for k = 1:N,
        X = X + a(k)*exp(i*k*w0*t);
        X = X + a(-k)*exp(i*(-k)*w0*t);
    end;
    if plot_var == 1,
        plot(t, X)
        xlabel ("t");
        title (["Série de Fourier com ", num2str(N), " termos"]);
    end;
end;
