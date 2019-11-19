
function times = performance_test(iterations, to_test)
    if to_test==1
        tic()
        for i = 1:iterations
            f1(randi([-100 100],1,30));
        end
        time1 = toc();
        tic()
        for i = 1:iterations
            f1_iterative(randi([-100 100],1,30));
        end
        time2 = toc();
    elseif to_test==2
        tic()
        for i = 1:iterations
            f2(randi([-500 500],1,30));
        end
        time1 = toc();
        tic()
        for i = 1:iterations
            f2_iterative(randi([-500 500],1,30));
        end
        time2 = toc();
    else
        tic()
        for i = 1:iterations
            f3(randi([-30 30],1,30));
        end
        time1 = toc();
        tic()
        for i = 1:iterations
            f3_iterative(randi([-30 30],1,30));
        end
        time2 = toc();
    end
    times = [time1 time2];
end
