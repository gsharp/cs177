#!/usr/local/bin/ruby1.9 -w
=begin
  Author: Glen Cuthbertson
  Email:  dont.spam.g(at)gmail.com
  Date:   2009.09.04
  Class: cs177
  Week: 3
  Homework: 1
  this file reports on itself:
    - size of file
    - each unique character used
    - count of each character used
    - total count of all characters used (should match size)
    - Least used character(s)
    - Most used character(s)
    - Source output
=end

#Constant with this file name
F = $0

#Constant to store file as string
Src = open(F){ |f| f.read}

#constant hash of unique characters and their occurance count
Char_hash = {}

# for each character in Src merge it and it's count to the Char_hash
Src.each_byte do |x|
  #don't use .chr if it's a space or a line break
  sym_char = case x.ord
    when 32 then '{space}' 
    when 10 then '\\n'     
    else x.chr  #use the actual chr value
  end
  Char_hash.merge!({sym_char => (Src.count x.chr)})
end

#local var sorting Char_hash by frequency of use lowest first
char_use = Char_hash.sort_by {|k,v| v} 

#local vars get counts for lowest and highest char usages
least_use = char_use.first[1]
top_use = char_use.last[1]

#local var arrays to track least / most popular char(s)
char_least = []
char_most = []

#local var to store total character count
char_count = 0

#formatting function with optional param for hr length, default 70
def hr (delimer = 70)
  puts "-" * delimer
end

# output
hr
puts "Character count analysis of the ruby script: #{F}"

hr
char_use.each do |k,v|
  puts "The Character: #{k} is used #{v} times."
  #while we're here:
  # start tracking count totals
  char_count = char_count + v
  #put least used chars into an array
  if v==least_use
    char_least.push(k)
  end
  #put most used chars into an array
  if v==top_use
    char_most.push(k)
  end
end

hr
puts "There are #{Char_hash.length} unique characters in the file: #{F}"

hr
puts "The following #{char_least.size} character(s) are only used #{least_use} time:"
puts char_least

hr
puts "The following #{char_most.size} character(s) occur most frequently (#{top_use} times):"
puts char_most

hr
puts "The size of #{$0} is: #{Src.size}"
puts "Character count total is: #{char_count}"
compare_msg = (Src.size == char_count) ? "Success!! Character count total is: #{char_count}, and size of file is #{Src.size}" : "something went wrong. Size.src and char_count do not match!"
puts compare_msg
hr
puts "done!"