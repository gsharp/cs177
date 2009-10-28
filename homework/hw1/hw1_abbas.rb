#!/usr/bin/env ruby 
#                 
# Author:  Abbas Moghtanei
# Date  :  09/04/09        
# Program Name: hw1.rb 
# This is the solution to the homework assignment#1 in CS177 Fall 09 
# Note: This program works only on ruby 1.9 and above.

#*******************************show_char()*******************************
def show_char(c)
    chars = %w( nul sch stx etx eot enq ack bel bs  tab nl  vtab
                ff  cr  so  si  dle dcl dc2 dc3 dc4 nak syn etb
                can em sub  esc fs  gs  rs  us sp
              )
    return(chars[c.ord])
end
#*************************************************************************
puts "My size is: #{File.size(__FILE__)}"

c,numchars = "",0
a = Hash.new(0)      # create a hash array, initialize elements to 0

fin = File.open(__FILE__, "r")

a[c] += 1 while (( c = fin.getc() ) != nil)
fin.close()

version  = RUBY_VERSION.to_f 

a.each_pair do |k,v|
    k = show_char(k) if k.ord < 33
    puts "number of #{k} is #{(version < 1.9) ? v.chr : v}" 
    numchars += v
end

puts "\nThe file size is: #{numchars}"

b = a.values.sort

print "The least character(s) used:"
a.each_pair {|k,v| print "\'#{(version < 1.9) ? k.chr : k}\' " if v == b[0]}
puts  "\nEach used #{b[0]} time(s)."
print "The most character(s) used:"
a.each_pair do |k,v|
    k = show_char(k) if k.ord < 33
    print "\'#{(version < 1.9) ? k.chr : k}\' " if v == b[-1]
end
puts  "\nEach used #{b[-1]} time(s)."


  
