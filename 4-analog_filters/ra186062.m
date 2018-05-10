wc = 5;
w = 0:0.01:20;

% a)
figure(1);
epsilon = 0.2;
i = 0;
for n=1:5,
    Habs = habs(w,wc,n,epsilon,1);
    plot(w, Habs)
    i = i+1;
    legendInfo1{i} = ['n = ' num2str(n)];
    hold on
end;
hold off
legend(legendInfo1, 'location', 'southwest')
xlabel('w')
ylabel('|H(jw)|')

% b)
figure(2);
n = 3;
i = 0;
for epsilon = 0.1:0.2:0.9,
    Habs = habs(w,wc,n,epsilon, 1);
    plot(w, Habs)
    i = i+1;
    legendInfo2{i} = ['epsilon = ' num2str(epsilon)];
    hold on
end;
hold off
legend(legendInfo2, 'location', 'southwest')
xlabel('w')
ylabel('|H(jw)|')

% c)
figure(3);
epsilon = 0;
i = 0;
for n=1:5,
    Habs = habs(w,wc,n,epsilon,2);
    plot(w, Habs)
    i = i+1;
    legendInfo3{i} = ['n = ' num2str(n)];
    hold on
end;
hold off
legend(legendInfo3)
xlabel('w')
ylabel('|H(jw)|')

% d)
figure(4);
X = @(w) (2/w)*sin(pi*w/wc);
Xvec = [];
for l = w,
    Xvec = [Xvec abs(X(l))];
end;
plot(w, Xvec)
xlabel('w')
ylabel('|X(jw)|')

%e)
figure(5);
H = @(w) (abs(w) <= wc) * 1  + (abs(w) > wc) * 0;
Hvec = [];
for l = w,
    Hvec = [Hvec H(l)];
end;
plot(w, Hvec)
xlabel('w')
ylabel('|H(jw)|')

figure(6);
Yvec = Hvec .* Xvec;
plot(w, Yvec)
xlabel('w')
ylabel('|Y(jw)|')

%f)
figure(7);
Hc = habs(w,wc,3,0.9,1);
Yc = Hc .* Xvec;
plot(w, Hc)
hold on
plot(w, Yc)
hold off
legend(['|h_C(jw)|'], ['|Y_C(jw)|']);
xlabel('w')

% g)
figure(8);
Hb = habs(w,wc,2,0,2);
Yb = Hb .* Xvec;
plot(w, Hb)
hold on
plot(w, Yb)
hold off
legend(['|h_B(jw)|'], ['|Y_B(jw)|']);
xlabel('w')

% h)
figure(9);
hold on
plot(w, Hvec)
plot(w, Hc)
plot(w, Hb)
hold off
legend(['|H_{ideal}(jw)|'], ['|H_C(jw)|'], ['|H_B(jw)|']);
xlabel('w')

figure(10);
hold on
plot(w, Yvec)
plot(w, Yc)
plot(w, Yb)
hold off
legend(['|Y_{ideal}(jw)|'], ['|Y_C(jw)|'], ['|Y_B(jw)|']);
xlabel('w')

input('>');
