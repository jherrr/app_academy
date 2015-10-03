#require "byebug"

class RPNCalculator
  # TODO: your code goes here!
  
    def initialize
       @num_stack = []
    end
    
    def push num 
        @num_stack.push(num)
    end
    
    def plus
        if @num_stack.size <2
            raise "calculator is empty"
        end
        @value = @num_stack.pop + @num_stack.pop
        @num_stack.push(@value)
    end
    
    def value
        @value
    end
  
    def minus
        if @num_stack.size <2
            raise "calculator is empty"
        end
        @value = (@num_stack.pop*-1) + @num_stack.pop
        @num_stack.push(@value)
    end
    
    def times
        if @num_stack.size <2
            raise "calculator is empty"
        end
        @value = @num_stack.pop * @num_stack.pop
        @num_stack.push(@value)
    end
    
    def divide
        if @num_stack.size <2
            raise "calculator is empty"
        end
        divisor = @num_stack.pop
        dividend = @num_stack.pop
        
        @value = dividend.fdiv(divisor)
        @num_stack.push(@value)
    end
  
    def tokens str
        tokens = str.split(' ')
        op_symbol = %w[/ + * -]
        tokens.collect! do |token|
           
            if op_symbol.include?(token)
                token = token.to_sym 
            else
                token = token.to_i
            end
        end
        
        tokens
        
    end
    
    def evaluate str
        #byebug
        token_array = tokens(str)
        
        op_symbol = [:/, :+, :*, :-]
        
        token_array.each do |tkn|
            if tkn.instance_of? Fixnum
                @num_stack.push(tkn)
            elsif op_symbol.include? tkn
                
                case tkn
                    when :/
                        divide
                    when :+
                        plus
                    when :-
                        minus
                    when :*
                        times
                end
                
            end
            
        end
        
         @value
        
    end
                        
            
        
       
       
                            
    
   
  
  
end
