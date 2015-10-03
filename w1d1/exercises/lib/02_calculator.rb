

def add(num1, num2)
    num1+num2
end

def subtract(num1, num2)
    num1-num2
end

def sum(arr)

    sum = 0
    arr.each do 
        |value| sum+=value
    end
    
    sum
    
end

def multiply(arr)
    
    product = 1
    arr.each do
        |value| product*=value
    end
    
    product
end

def power(base, exponent) 
    
    base**exponent
    
end


def factorial(num)
    
    if num == 0
        return 1
    end
    
    multiply((1..num))
    
end
    