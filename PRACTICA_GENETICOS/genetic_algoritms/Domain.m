function domain = Domain (domain_name)
    if domain_name == "d1"
        domain = [-100 100];
    elseif domain_name == "d2"
        domain = [-500 500];
    elseif domain_name == "d3"
        domain = [-30 30];
    else
        error("Invalid domain name")
    end
end