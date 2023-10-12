function X = myFFT(x, N)
    % Ajustar N para a próxima potência de 2 maior ou igual a N
    N = 2^nextpow2(N);

    N2 = N / 2;

    % Verifique e ajuste o tamanho do vetor de entrada x
    if length(x) > N
        x = x(1:N);
    end

    if length(x) < N
        x = [x, zeros(1, N - length(x))];
    end

    % Caso base
    if N == 1
        X = x;
    else
        xpar = zeros(1, N2);
        ximpar = zeros(1, N2);

        for i = 1:N2
            xpar(i) = x(2*i-1);
            ximpar(i) = x(2*i);
        end

        Xpar = myFFT(xpar, N2);
        Ximpar = myFFT(ximpar, N2);

        X = zeros(1, N);

        for i = 1:N2
            W = exp(-1i * 2 * pi / N * (i - 1));
            X(i) = Xpar(i) + W * Ximpar(i);
            X(i + N2) = Xpar(i) - W * Ximpar(i);
        end
    end
end