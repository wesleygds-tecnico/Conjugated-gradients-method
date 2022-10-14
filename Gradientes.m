function [] = Gradientes (A,b,x,it)
n = length(A);
D = eig(A);
a = 1;
for k = 1:n
    C(1:k,1:k) = A(1:k,1:k);
    %fprintf('determinantes \n')
    %fprintf('Autovalor analisado \n')
    if (det(C) < 0)
        fprintf('A matriz "A" não é definida positiva \n')
        a = 0;
        break
    end
end
if (a == 1)
    r = A*x - b;                 %Resíduo 1
    for k = 1:1000
        k
        xold = x;
        tmin = (r'*r)/((A*r)'*r);    %Quanto andar
        x = x - tmin*r                  %Novo chute
        r = r - tmin*A*r;             %Novo resíduo
        erro = norm(x-xold)/norm(x);
        if (erro<10^(-it))
            fprintf('Número de iterações \n')
            disp(k)
            break
        end
    end
end
fprintf('Vetor solução \n')
disp(x)
fprintf('Verificação \n')
d=A*x;
disp(d)
fprintf('Norma do vetor resíduo \n')
r = norm(r);
disp(r)
end