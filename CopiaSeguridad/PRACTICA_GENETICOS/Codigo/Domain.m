function domain = Domain (config)
    if config.domain == "d1"
        domain = [-100 100];
    elseif config.domain == "d2"
        domain = [-500 500];
    elseif config.domain == "d3"
        domain = [-30 30];
    else
        error("Invalid domain name")
    end
end