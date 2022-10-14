    function [] = GradConj(A,b,x,it)
n = length(A);
D = eig(A);
a = 1;
for k = 1:n
    C(1:k,1:k) = A(1:k,1:k);
    %fprintf('determinantes \n')
    %fprintf('Autovalor analisado \n')
    if (det(C) <= 0 && D(k,1))
        fprintf('A matriz "A" não é definida positiva \n')
        a = 0;
        break
    end
end
if (a == 1)
    r = b - A*x;
    d = r;                   %Distância 1
    for k = 1:1000000
        x0 = x
        fprintf('tmin \n')
        tmin = (r'*r)/(d'*(A*d))    %Quanto andar
        fprintf('x \n')
        x = x + tmin*d              %Novo chute
        fprintf('r \n')
        r1 = r - tmin*A*d           %Novo resíduo
        fprintf('betha \n')
        betha = (r1'*r1)/(r'*r)     %Betha para cálcular nova distância
        fprintf('Distância \n')
        d1 = r1 + betha*d           %Nova distância
        erro = norm(x-x0)/norm(x);
        if ((erro)<10^(-it))
            fprintf('Número de iterações \n')
            disp(k)
            break
        end
        fprintf('Produto vetorial entre os resíduos \n')
        t = r1'*r;
        disp(t)
        r = r1;                     %Atualiza vetores para nova iteração
        d = d1;
    end
end
fprintf('Vetor solução \n')
disp(x)
fprintf('Verificação \n')
d=A*x;
disp(d)
fprintf('Erro \n')
disp(erro)
end