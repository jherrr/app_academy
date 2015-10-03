class Book
  # TODO: your code goes here!
  
    def title
        @title
    end
  
    def title=(str)
  
        stop_words = %w{the a by on for of are 
        with just but and to the my I has some over and in of an}
        
        arrS = str.split(' ')
        
        output = arrS.map do |word|
            if !stop_words.include?(word)
                word.capitalize 
            else
                word
            end
        end
    
        output[0].capitalize!
        @title = output.join(' ')
        
    end
  
  
end
