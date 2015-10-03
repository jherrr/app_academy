


def ftoc(degF)
    
    degC = (degF - 32).*(5.0).fdiv(9.0)
    
end

def ctof(degC)

    degF = (degC.*9.0.fdiv(5.0)) + 32.0
    
    degF
end