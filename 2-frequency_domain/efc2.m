x = @(n,w) cos(n*w);
N = 1000;
vec = [];

% % a)
% w = pi/2;
% for i = 0:N,
%     X = [vec; x(i,w)];
% end;
% Y = sistema_desconhecido(X)
% stem(X)
% hold on
% stem(Y, 'm')
% legend('X', 'Y')
% hold off


% % b)
% w = pi/200;
% for i = 0:N,
%     X = [vec; x(i,w)];
% end;
% Y = sistema_desconhecido(X)
% stem(Y)
% hold on
% 
% w = pi/20;
% for i = 0:N,
%     X = [vec; x(i,w)];
% end;
% Y = sistema_desconhecido(X)
% stem(Y, 'm')
% legend('w = pi/200', 'w = pi/20')
% hold off

% % c)
% 
% % d)
% 
% 
