#!/usr/bin/env ruby
#                 
# Author:  Abbas Moghtanei
# Date  :  09/25/09        
# Program Name: n2e.rb 
# This program is defining the function n2e to accept a numeric integer
# or string, and convert it to English. For example n2e(34) would return
# thirty four. 

#*********************************n2e()**********************************
def n2e(num)

   return '' if num.kind_of?(String) and (num =~ /^[0]+$/)
   return '' if num.kind_of?(String) and (num !~ /^\d+$/)
   
   num = num.to_i if num.kind_of?(String)
   n = num.to_s.split(//)
   len = n.size
   
   # To create constance inside a function, we need to use instance
   # variables. Ruby 1.9 is very picky about this subject!

   @Hundred = 'hundred'
   @Thousand= 'thousand'
   @Million = 'million'
   @Billion = 'billion'

   h = { :ones     => %w(zero one two three four five six seven
                          eight nine ten eleven twelve thirteen
                          fourteen fifteen sixtee seventeen eigthteen
                          nineteen),
         :twos     => %w(nil ten twenty thirty forty fifty sixty 
                          seventy eighty ninety)
       }

      if num < 20
         str = h[:ones][num] 
      elsif len == 2
         str = (n[0] > "1") ? h[:twos][n[0].to_i] : h['tens'][n[0].to_i-1] 
         str += (n[1] > "0" ) ? (' ' + h[:ones][n[1].to_i])  : ''
      elsif len == 3
         str = n2e(n[0])+' '+@Hundred+' '+ n2e(n[1]+n[2])
      elsif len == 4
         str = n2e(n[0])+' '+@Thousand+' '+ n2e(n[1]+n[2]+n[3])
      elsif len == 5  
         str = n2e(n[0]+n[1])+' '+ @Thousand +' '
         str += n2e(n[2]+n[3]+n[4])
      elsif len == 6  
         str = n2e(n[0]+n[1]+n[2])+' '+ @Thousand +' '
         str += n2e(n[3]+n[4]+n[5])
      elsif len == 7  
         str = h[:ones][n[0].to_i]+' '+@Million+' '
         str += n2e(n[1]+n[2]+n[3]+n[4]+n[5]+n[6])
      elsif len == 8  
         str = n2e(n[0]+n[1])+' '+ @Million + ' '
         str += n2e(n[2]+n[3]+n[4]+n[5]+n[6]+n[7])
      elsif len == 9  
         str = n2e(n[0]+n[1]+n[2])+' '+ @Million + ' '
         str += n2e(n[3]+n[4]+n[5]+n[6]+n[7]+n[8])
      elsif len == 10  
         str = h[:ones][n[0].to_i]+' '+@Billion+' '
         str += n2e(n[1]+n[2]+n[3]+n[4]+n[5]+n[6]+n[7]+n[8]+n[9])
      elsif len == 11  
         str = n2e(n[0]+n[1])+' '+@Billion+' '
         str += n2e(n[2]+n[3]+n[4]+n[5]+n[6]+n[7]+n[8]+n[9]+n[10])
      elsif len == 12  
         str = n2e(n[0]+n[1]+n[2])+' '+@Billion+' '
         str += n2e(n[3]+n[4]+n[5]+n[6]+n[7]+n[8]+n[9]+n[10]+n[11])
      else
         abort("Number Overflow\n")
      end
      return str
end

# 25.times { n=rand(99999999);printf("%8d = %-s\n", n , n2e(n)) }

loop do
   print "Give me a number, -1 to stop: "
   num = gets.to_i
   break if num < 0
   puts n2e(num)
end

 
