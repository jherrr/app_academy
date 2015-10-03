class Temperature
  # TODO: your code goes here!
  
    def initialize(temp_option)
        if !temp_option.instance_of? Hash
            raise "wrong unit temp input"
        end
        
        if temp_option.keys.include?(:f)
            @temp_unit = :f
            @temp = temp_option[:f]
        else
            @temp_unit = :c
            @temp = temp_option[:c]
        end
        
    end
  
    def in_fahrenheit
        if @temp_unit == :f
            return @temp
        else 
            return ctof(@temp)    
            
        end
        
    end
        
    def in_celsius
        if @temp_unit == :c
            return @temp
        else 
            return ftoc(@temp)    
            
        end
        
    end

    def self.from_celsius(temp)
        new(:c => temp)
    end

    def self.from_fahrenheit(temp)
        new(:f => temp)
    end

  
    def ftoc(degF)
        
        degC = (degF - 32).*(5.0).fdiv(9.0)
        
    end

    def ctof(degC)
    
        degF = (degC.*9.0.fdiv(5.0)) + 32.0
        
        degF
    end
      
  
  
end


class Celsius < Temperature
    def initialize(temp)
       super(:c => temp)
    end
    
end


class Fahrenheit < Temperature
    def initialize(temp)
        super(:f => temp)
    end
    
end