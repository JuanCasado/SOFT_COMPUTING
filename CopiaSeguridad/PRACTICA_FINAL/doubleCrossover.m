function [fenotype_change1, fenotype_change2] = doubleCrossover (father_1, father_2)
    length_fenotype = length(father_1);
    index = randi(length_fenotype,1,2);
    index = sort(index);
    if index(1)==index(2)
        fenotype_change1 = [father_1(1:index) father_2(index+1:end)];
        fenotype_change2 = [father_2(1:index) father_1(index+1:end)];
    else
        fenotype_change1 = [father_1(1:index(1)) father_2(index(1)+1:index(2)) father_1(index(2)+1:end)];
        fenotype_change2 = [father_2(1:index(1)) father_1(index(1)+1:index(2)) father_2(index(2)+1:end)];
    end
end