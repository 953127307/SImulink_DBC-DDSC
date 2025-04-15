function S = RBF_based(input)

NN_size = 24;
S = zeros(NN_size,1);
temp = 0;
for k = 1:NN_size
    for i = 1:length(input)
        temp = temp + (input(i)-(6-6*2/NN_size*(k-1)))^2;
    end
    S(k) = exp(-temp/2);
    temp=0;
end

% Weight_norm = norm(V);
