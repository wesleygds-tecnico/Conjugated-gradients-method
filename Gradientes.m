function [] = Gradientes (A,b,x,it)
n = length(A);
D = eig(A);
a = 1;
for k = 1:n
    C(1:k,1:k) = A(1:k,1:k);
    %fprintf('determinantes \n')
    %fprintf('Autovalor analisado \n')
    if (det(C) < 0)
        fprintf('A matriz "A" n�o � definida positiva \n')
        a = 0;
        break
    end
end
if (a == 1)
    r = A*x - b;                 %Res�duo 1
    for k = 1:1000
        k
        xold = x;
        tmin = (r'*r)/((A*r)'*r);    %Quanto andar
        x = x - tmin*r                  %Novo chute
        r = r - tmin*A*r;             %Novo res�duo
        erro = norm(x-xold)/norm(x);
        if (erro<10^(-it))
            fprintf('N�mero de itera��es \n')
            disp(k)
            break
        end
    end
end
fprintf('Vetor solu��o \n')
disp(x)
fprintf('Verifica��o \n')
d=A*x;
disp(d)
fprintf('Norma do vetor res�duo \n')
r = norm(r);
disp(r)
end