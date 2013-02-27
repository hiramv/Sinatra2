class Fixnum
  

  def in_words
  
    small = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
    teens = {10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18=> "eighteen", 19 => "nineteen"}
    tens = {10 => "ten", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety", 100 => "hundred"}
    
    if self >= 0 && self <= 9
      return small[self]
      
    elsif self < 20 
      return teens[self]
    
    elsif self < 100
      x = self % 10                     #get basic value
      y = self - x                       #get tens value
      return "#{tens[y]} #{small[x]}"
    
    elsif self < 1000
      a = self % 100
      
      b = (self - a)/100                #get hundreds value
      c = a % 10
      d = a - c
      if a < 9 
        return "#{small[b]} hundred #{small[a]}"
      elsif a > 9 && a < 20
        return "#{small[b]} hundred #{teens[a]}"
      elsif a>=20
        return "#{small[b]} hundred #{tens[d]} #{small[c]}"
      end
      
    else 
      "invalid number for this exercise"
    end
  end

  
end

