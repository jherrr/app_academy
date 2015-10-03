

def reverser &string_block
    
    str = string_block.call
    arrS = str.split(' ')
    
    output = arrS.map do |word|
        word.reverse!
    end
   
   output.join(' ')
    
end

def adder(add = 1, &num_block)
    
    num = num_block.call
    
    num + add
    
end

def repeater(numRepeats = 1, &repeat_block)
    
    numRepeats.times do 
        
        repeat_block.call
        
    end
    
end