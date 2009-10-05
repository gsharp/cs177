#!/usr/local/bin/ruby1.9 -w
=begin
  Test Example from class cs177
  Ruby script to covert temp from f to c or c to f
=end

print "enter temp and scale (c or f):"
str = gets
exit if str.nil? or str.empty?
str.chomp!

temp,scale = str.split(" ");
abort "#{temp} is not a valid number" if temp !~/-?\d+/
temp = temp.to_f

case scale
when "C", "c"
  f = 1.8*temp + 32
when "F", "f"
  c = (5.0/9.0)*(temp-32)
else
  abort "must specify c or f"
end

f.nil? ? (puts "#{c} degrees C") : (puts "#{f} degrees f")

