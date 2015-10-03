#require 'byebug'

class Fixnum
    
  def in_words
    #debugger
    return "zero" if isZero?
    
    parseEveryThreeDigits(self).strip
        
  end
    
  private
    
  def isZero?
    self == 0
  end
    
  def parseEveryThreeDigits(num)
    tres_commas = ["thousand", "million", "billion", "trillion"]
    
    output = []
    skip = true
    
    while num > 0 
    
      three_digits = num%1000
      num = num / 1000

      digit_string = parseThreeDigits(three_digits).strip

      unless skip
        current_comma = tres_commas.shift 
        
        if three_digits != 0
          output.unshift(current_comma)
        end
      end

      skip = false
      
      output = output.select do |string|
        string.strip.length >0
      end
      output.unshift(digit_string)
      
    end
    
    output.join(' ')
      
  end
    
  def parseThreeDigits(num)
      output = []
      
      if num == 0
        return ""
      end
      
      output << parseHundrethsDigit(num)
      output << parseTwoDigits(num%100)
      output.join(' ')
  end
  
  def parseTwoDigits(num)
      
      if num == 0
        return ""
      end
      
      if num < 10
          return onesString(num)
      elsif num >= 10 && num < 20
          return weirdTensString(num)
      elsif num >= 20 && num < 100
          numS = num.to_s
          return "#{tensString(numS[0].to_i)} #{onesString(numS[1].to_i)}"
      end
  end 
    
  def onesString(key)
    ones = {0 => "", 1 => "one", 2 => "two", 3  => "three",  4  => "four", 5  => "five",
        6  => "six", 7  => "seven", 8  => "eight", 9  => "nine"}
        
    ones[key]
  end
  
  def weirdTensString(key)
    weird_tens = {10 => "ten", 11 => "eleven", 12 => "twelve", 13  => "thirteen",  14  => "fourteen",
        15  => "fifteen", 16  => "sixteen", 17  => "seventeen", 18  => "eighteen",
        19  => "nineteen"}
    weird_tens[key]
  end
  
  def tensString(key)
    tens = { 2 => "twenty", 3  => "thirty",  4  => "forty", 5  => "fifty",
        6  => "sixty", 7  => "seventy", 8  => "eighty", 9  => "ninety"}
  
    tens[key]
  end
    
  def parseHundrethsDigit(num)
    output = ""
    
    unless hundrethsDigitZero?(num)
      output = stringifyHundredthsDigit(num)
    end
    
    output
  end   
     
     
  def hundrethsDigit(num)
    digit = num/100
  end
     
  def hundrethsDigitZero?(num)
    digit = hundrethsDigit(num)
   
    if digit == 0 
      true
    else
      false
    end
  end
  
  def stringifyHundredthsDigit(num)
    digit = hundrethsDigit(num)
      
    "#{onesString(digit)} hundred"
  end
       
end
        
        
    
   
    
    
            
