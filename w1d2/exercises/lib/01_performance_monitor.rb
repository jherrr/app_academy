




    
def measure num=1, &code_block
   
    total_time = 0
    
    num.times do
        time_begin = Time.now
        yield 
        time_end = Time.now
        
        duration = time_end - time_begin
        total_time+=duration
    end
    
    average_time = total_time.fdiv(num)   
    
   
    
end
    
    
