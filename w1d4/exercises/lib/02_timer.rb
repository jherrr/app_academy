

class Timer
    
    
    def initialize
        @hour = 0
        @minute = 0
        @seconds = 0
        
        
    end
    
    def seconds
        @seconds
    end
    

    def seconds=(sec)
        @hour = sec/3600
        sec = sec%3600
        @minute = sec/60
        sec = sec%60
        @seconds = sec
    end
   
    def time_string
        
        time_units = [@hour, @minute, @seconds]
        
        output = time_units.map do |unit|
            
            unit = padded(unit)
            
        end
        
        output = output.join(":")
        
        
        
    end
    
    
    def padded(num)
    
        if num < 10
            return num = '0' + num.to_s
        else
            return num = num.to_s
        end
    end
    
end