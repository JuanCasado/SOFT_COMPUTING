function result = test(to_test)
    if to_test==1
        input = randi([-100 100],1,30);
        result1 = f1(input);
        result2 = f1_iterative(input);
    elseif to_test==2
        input = randi([-500 500],1,30);
        result1 = f2(input);
        result2 = f2_iterative(input);
    else
        input = randi([-30 30],1,30);
        result1 = f3(input);
        result2 = f3_iterative(input);
    end
    result = (result1 == result2);
end