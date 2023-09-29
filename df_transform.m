function xk = df_transform(xn,N);
L= length(xn);
if(N<L)
    error('N deveria ser maior que L')
end 
xn= [xn zeros(1,N-L)];

for k=0: N-1
    for n=0:N-1
        Wn=exp(-j*2*pi*k*n/N);
        X1(k+1,n+1)= Wn;
    end
end


xk= X1*xn';     