class Dictionary
  # TODO: your code goes here!
    def initialize
        @dict_hash = {}
    end
  
    def entries
       @dict_hash
    end
  
    def add param
        if param.instance_of? Hash
            @dict_hash = @dict_hash.merge(param)
        elsif param.instance_of? String
            @dict_hash[param] = nil
        end
        
    end
    
    def keywords
        @dict_hash.keys.sort
    end

    def include?(keyword)
        @dict_hash.include?(keyword)
    end
        
    def find(search_keyword)
        
        output = {}
        @dict_hash.each do |keyword, definition|
            if keyword.match(/^#{search_keyword}/)
                output[keyword] = definition
            end
        end
        
        output
        
        
    end
    
    def printable
       
       output = ""
       @dict_hash.sort.each do 
           |inner_array| output+=%Q{[#{inner_array[0]}] "#{inner_array[1]}"\n}
       end
       
       output.chomp
        
    end
    
    
  
end
