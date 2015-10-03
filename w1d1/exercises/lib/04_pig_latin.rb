

def translate(str)

    if str.include?(".") || str.include?("?")||str.include?("!")
        translateWithPunct(str)
    else
        translateSentence(str)
    end
   
end

def translateWithPunct(str)
     punctA = []
    str.scan(/\.|\!|\?/) do
        |punctuation| punctA << punctuation
    end

    arrS = str.split(/\.|\!|\?/)
    
    output = ""
    
    arrS.each_with_index do 
        |sentence, index| output+=translateSentence(sentence) + punctA[index] + " "
    end

    output.strip
end

def translateSentence(str)
    

    arrS = str.split(" ")
    
    output = arrS.map do |word|
        translateWord(word)
    end

    output.join(' ')


end

def translateWord(word)
    
    vowels = %w[a e i o]
    
  
    
=begin

    consAppend = 0
    word.each_char do 
        |letter| 
        
        if vowels.include?(letter)
            break
        else
            consAppend+= letter 
            index+=1
        end
        
    end
    
     output = word.slice(index, word.length) + consAppend + "ay"
=end
    
    
    index = 0
    while true
        if vowels.include?(word[index])
            break
        elsif word[index] == 'u'
            if index == 0
                break
            elsif word[index - 1]!= 'q'
                break
            else
                index += 1
            end
        else
            index+=1
        end
        
    end
    
    output = word.slice(index, word.length) + word.slice(0,index) + "ay"
    
    if isCapitalized?(word)
        output.downcase!
        output.capitalize!
    end
    
    output
    
end

def isCapitalized?(word)
    
    firstLetter = word[0].ord
    
    return firstLetter >=65 && firstLetter <= 90
    
end
    
   