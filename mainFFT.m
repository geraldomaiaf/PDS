function X = mainFFT(x,N)
    % Caso base da recursão: se o tamanho do vetor for 1, retorne o próprio vetor
    if N == 1
        X = x;
        return;
    end
    
    L= length(x);
    if(N<L)
        error('N should always ')
    end
    
    x= [x zeros(1,N-L)];

    
    % Dividir o vetor em partes pares e ímpares
    x_par = x(1:2:N);
    x_impar = x(2:2:N);
    
    % Calcular a FFT das partes pares e ímpares recursivamente
    X_par = minhaFFT(x_par);
    X_impar = minhaFFT(x_impar);
    
    % Combinar as FFTs das partes pares e ímpares
    W = exp(-2i * pi / N) .^ (0:N/2-1);
    X = [X_par + W .* X_impar, X_par - W .* X_impar];
end