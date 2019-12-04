function [fenotype_change1, fenotype_change2] = singleCrossover (father_1, father_2)
    index = randi(length(father_1),1);
    fenotype_change1 = [father_1(1:index) father_2(index+1:end)];
    fenotype_change2 = [father_2(1:index) father_1(index+1:end)];
end