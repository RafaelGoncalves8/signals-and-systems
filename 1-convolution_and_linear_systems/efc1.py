import matplotlib.pyplot as plt
import numpy as np


# convolucao
def conv(h, x):
    H = getH(h, x)
    return np.dot(H, x)

# construcao da matriz H a partir de h (resposta ao impulso) e x (entrada)
def getH(h, x):
    K = len(x)
    D = len(h)
    P = K + D - 1
    H = np.zeros([P,K])
    for i in range(P):
        for j in range(K):
            if (i - j) in range(D):
                H[i,j] = h[(i-j)]
            else:
                H[i,j] = 0
    return H

h = np.array([[1], [-0.5]])

w1 = np.array([1,0.5,0.5**2,0.5**3,0.5**4])
w2 = np.array([1,1.5,0.7,-0.2, 0.3])

print("w1:", '\n', conv(w1, h))
print("w2:", '\n', conv(w2, h))

# funcao signum
sign = lambda X: [e/abs(e) for e in X[0,:]]
# 100 amostras
s = np.array(sign(np.random.randn(1,100)))

#
x = conv(h,s)

n = np.linspace(0, 99, 100)
markerline1, stemlines1, baseline = plt.stem(n, s, '-.')
markerline2, stemlines2, baseline = plt.stem(n, x[:-1], '-.')
plt.setp(baseline, 'color', 'r', 'linewidth', 1)
plt.setp(stemlines1, 'color', 'b', 'linewidth', 0.5)
plt.setp(stemlines2, 'color', 'g', 'linewidth', 0.5)
plt.setp(markerline1, 'color', 'b', 'linewidth', 1)
plt.setp(markerline2, 'color', 'g', 'linewidth', 1)

plt.xlabel('n')
plt.legend(['s[n]', 'x[n]'], loc=1)

plt.show()

y1 = conv(w1,x)
y2 = conv(w2,x)

plt.clf()
n = np.linspace(0, 99, 100)
markerline1, stemlines1, baseline = plt.stem(n, s, '-.')
markerline2, stemlines2, baseline = plt.stem(n, y1[:100], '-.')
plt.setp(baseline, 'color', 'r', 'linewidth', 1)
plt.setp(stemlines1, 'color', 'b', 'linewidth', 0.5)
plt.setp(stemlines2, 'color', 'r', 'linewidth', 0.5)
plt.setp(markerline1, 'color', 'b', 'linewidth', 1)
plt.setp(markerline2, 'color', 'r', 'linewidth', 1)

plt.title('Filtro w1')
plt.xlabel('n')
plt.legend(['s[n]', 'y1[n]'], loc=1)

plt.show()

plt.clf()
markerline1, stemlines1, baseline = plt.stem(n, s, '-.')
markerline2, stemlines2, baseline = plt.stem(n, y2[:100], '-.')
plt.setp(baseline, 'color', 'r', 'linewidth', 1)
plt.setp(stemlines1, 'color', 'b', 'linewidth', 0.5)
plt.setp(stemlines2, 'color', 'r', 'linewidth', 0.5)
plt.setp(markerline1, 'color', 'b', 'linewidth', 1)
plt.setp(markerline2, 'color', 'r', 'linewidth', 1)

plt.title('Filtro w2')
plt.xlabel('n')
plt.legend(['s[n]', 'y2[n]'], loc=3)

plt.show()
