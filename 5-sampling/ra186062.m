# a)
[y Fs] = audioread('queen_I_want_it_all.wav');
y = y(:,1) + y(:,2); # sum of 2 channels
Fs
n_samp = size(y, 1)

# b)
espectro(y);

# c)
M = 6;
ydec = [];

for t = 1:M:n_samp,
    ydec = [ydec; y(t)];
end;

Fs_dec = Fs/M
n_samp_dec = size(ydec, 1)

espectro(ydec);

# d)

soundsc(y, Fs);
soundsc(ydec, Fs_dec);

# e)
espectro(kaiser(0.45,2));
input('>');
espectro(kaiser(0.45,0.5));
input('>');
espectro(kaiser(1.5,2));
input('>');

# f)
h = kaiser(0.45, 0.5);
z = conv(h, y);

espectro(z);
soundsc(z, Fs);
input('>');

# g)

z_dec = [];
for t = 1:M:n_samp,
    z_dec = [z_dec; z(t)];
end;

espectro(z_dec);
soundsc(z_dec, Fs_dec); 

input('>');
