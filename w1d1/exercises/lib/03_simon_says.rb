

def echo(str)
    str
    
end


def shout(str)
    str.upcase
end

def repeat(str, num= 2)
    
    output = str
    (num-1).times do 
        output += " " + str
    end
    
    output.lstrip
    
end

def start_of_word(str, num)
    
    str.slice(0,num)
    
end

def first_word(str)
    
    arrS = str.split(' ')
    arrS[0]
    
end

def titleize(str)
    
    
    stop_words = %w{the a by on for of are 
    with just but and to the my I has some over}
    
    arrS = str.split(' ')
    
    output = arrS.map do |word|
        if !stop_words.include?(word)
            word.capitalize 
        else
            word
        end
    end

    output[0].capitalize!
    output.join(' ')
    
end