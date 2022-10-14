    function [] = GradConj(A,b,x,it)
n = length(A);
D = eig(A);
a = 1;
for k = 1:n
    C(1:k,1:k) = A(1:k,1:k);
    %fprintf('determinantes \n')
    %fprintf('Autovalor analisado \n')
    if (det(C) <= 0 && D(k,1))
        fprintf('A matriz "A" n�o � definida positiva \n')
        a = 0;
        break
    end
end
if (a == 1)
    r = b - A*x;
    d = r;                   %Dist�ncia 1
    for k = 1:1000000
        x0 = x
        fprintf('tmin \n')
        tmin = (r'*r)/(d'*(A*d))    %Quanto andar
        fprintf('x \n')
        x = x + tmin*d              %Novo chute
        fprintf('r \n')
        r1 = r - tmin*A*d           %Novo res�duo
        fprintf('betha \n')
        betha = (r1'*r1)/(r'*r)     %Betha para c�lcular nova dist�ncia
        fprintf('Dist�ncia \n')
        d1 = r1 + betha*d           %Nova dist�ncia
        erro = norm(x-x0)/norm(x);
        if ((erro)<10^(-it))
            fprintf('N�mero de itera��es \n')
            disp(k)
            break
        end
        fprintf('Produto vetorial entre os res�duos \n')
        t = r1'*r;
        disp(t)
        r = r1;                     %Atualiza vetores para nova itera��o
        d = d1;
    end
end
fprintf('Vetor solu��o \n')
disp(x)
fprintf('Verifica��o \n')
d=A*x;
disp(d)
fprintf('Erro \n')
disp(erro)
end