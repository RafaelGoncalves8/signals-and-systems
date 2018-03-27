x = @(n,w) cos(n*w);
N = 1000;

% a)
w = pi/2;
for i = 0:N,
    y = sistema_desconhecido(x(i,w));
    print(i, y)
end;

% b)
w = pi/200;
for i = 0:N,
    y = sistema_desconhecido(x(i,w));
    print(i, y)
end;

w = pi/20;
for i = 0:N,
    y = sistema_desconhecido(x(i,w));
    print(i, y)
end;

% c)

% d)


