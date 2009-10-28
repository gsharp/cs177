#!/usr/local/bin/ruby1.9 -w
#                 
# Author:  Glen Cuthbertson
# Date  :  10/04/2009
# Program Name: hw3.rb
# for 0-999,999,999 output english translations of the number
# Note: This program works only on ruby 1.9 and above.
# redesigned from interactive mode to test output mode

#*******************************setup()*******************************
def setup (number = nil)
  #get user input
  #puts "enter a number:"
  #n = gets.chomp
  n = number
  abort "decimals or negatives not supported" if n =~ /[\.||\-]/

  # english numbers array
  $arr       = []
  $arr[0]    = nil
  $arr[1]    = %w(zero one two three four five six seven eight nine)
  $arr[2]    = %w(nil nil twenty thirty fourty fifty sixty seventy eitghty ninety)
  $arr[2][0] = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  $arr[3]    = %w(hundred thousand million billion trillion)

  # take care of zero right away and restart
  if n.to_i == 0
    puts number
    puts $arr[1][0]
    puts "----------"
    return
  end
    
  # parse number into hundreds comma delim string 
  nFormat = n.to_s.reverse.scan(/\d{1,3}/).join(',').reverse
  # split hundreds segments into an array
  numArr = nFormat.split(',')
  puts nFormat
  # for each hundreds segment setup denomination and render hundreds block
  count = numArr.size - 1 
  numArr.each do |e|
    if e.to_i > 0
      writeNum e
      print $arr[3][count] + ' ' if count > 0
    end
    count -= 1
  end
  puts
  puts "---------"
  # setup # ask for another number
end

#*******************************writeNum()*******************************
# output hundreds segments recursively
def writeNum (group)
  dig = group[0].to_i # left most digit
  if dig != 0
    case group.size
    when 3,1 # we know we need single digit output
      print $arr[1][dig] 
      print ' ' + $arr[3][0] if group.size == 3 # show for hundreds
    when 2 # we need special 2 digit words
      case dig
      when 1 # need teens
        print $arr[2][0][group[1].to_i] + ' '
        return
      else # need *ty's
        print $arr[2][dig]
        hyph = true if group[1].to_i != 0 # set hyphen if there is a following digit
      end
    end
    hyph ? (print '-') : (print ' ')
  end
  writeNum(group[1..-1]) if group.size != 0 # remove left digit and call again
end

puts "---------hw3 test output----------------"
puts "Glen Cuthbertson"
puts "==================================="
# setup # initialize for user entry
setup 0
setup 1
setup 10
setup 11
setup 19
setup 20
setup 25
setup 77
setup 90
setup 100
setup 10000000001
setup 1234567890
setup 999000000001
puts "-------random tests--------"
(1..12).each do |i|
  string = "" 
  i.times do
    start = true
    makeD = start ? 1 + rand(9) : rand(10)
    string += makeD.to_s 
  end
  setup string.to_i
end