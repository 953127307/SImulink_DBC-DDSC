function show_time(t,step,N,Time)

    if t == 0
        fprintf('t: ');
    end

    if mod(t,N) == 0
        fprintf('%d ',t);
    end

    if t == Time
        fprintf('\n');
    end

end
