function X = minhaFFT_iterativa(x, N)
    % Se N não for especificado, ajuste-o para a próxima potência de 2 maior ou igual ao tamanho de x
    if nargin < 2
        N = 2^nextpow2(length(x));
    end

    N2 = N / 2;

    % Verifique e ajuste o tamanho do vetor de entrada x
    if length(x) > N
        x = x(1:N);
    end

    if length(x) < N
        x = [x, zeros(1, N - length(x))];
    end

    X = zeros(1, N);

    for stage = 1:log2(N)
        step = 2^stage;
        for n = 1:N/step
            W = exp(-1i * 2 * pi * (n - 1) / N);
            for k = 1:step/2
                a = x(k + (n - 1) * step);
                b = x(k + (n - 1) * step + step/2) * W;
                x(k + (n - 1) * step) = a + b;
                x(k + (n - 1) * step + step/2) = a - b;
            end
        end
    end
    X=x;
end