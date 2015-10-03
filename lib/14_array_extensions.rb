
class Array
    
    def sum
        output = 0
        each {|value| output+= value }
       
        output
    end
    
    def square
        map {|value| value*=value}
    end
    
    def square!
        map! {|value| value*=value}
    end
    
end