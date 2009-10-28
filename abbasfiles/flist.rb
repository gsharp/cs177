#!/usr/bin/ruby 
#                 
# Author:  Abbas Moghtanei
# Date  :  09/23/09        
# Program Name: flist.rb 
# Note: This is a faster version of list.rb . The speed comes from the
# fact that, the entire file is being loaded to the memory.
#********************************parse_range()****************************
def parse_range(str)
    if str == '-'
       from = 1; to = $NumLines
    elsif str == '$'
       from = to = $NumLines
    elsif !str.include?('-')          # like 87
       from = to = str
    else                              # it includes '-'
         p = str.index('-')           # find the position of '-'
         if p == 0                    # like -23
            from = 1
            to   = str[1...str.size]
         elsif p == str.size - 1      # like 23-
            from = str[0...p]
            to   = $NumLines
         else                         # like 23-156
            from = str[0,p]          
            to   = str[(p+1)...str.size]
         end
    end

    from = $NumLines if from == '$'
    to   = $NumLines if to   == '$'

    from = from.to_i if from.kind_of? String
    to   = to.to_i   if to.kind_of? String

    abort("Invalid range\n") if from <= 0 or to <= 0
    abort("Invalid range\n") if from > $NumLines or to > $NumLines

    return from,to
end
#******************************load_file()*******************************
def load_file(filename,from, to)
    temparr = []
    n = 0 
    from, to = to, from if from > to
    open(filename, 'r') do |f|
       for i in 1..(from-1)
          f.gets
       end
       from.upto(to) { temparr[n] = f.gets.chomp!; n += 1 }
    end
    temparr
end
#************************************************************************
txt = " <-n> line-range filename\n"
abort("usage: " + $0[2...$0.size] + "#{txt}")  if ARGV.size == 0
nflag = false
nflag = true if ARGV.delete("-n") == "-n"
abort("usage: " + $0[2...$0.size] + "#{txt}")  if ARGV.size == 0

if ARGV.size == 1
   line_range = nil
   filename = ARGV[0]
else
   line_range = ARGV[0]
   filename   = ARGV[1]
end

buf = IO.readlines(filename) 
$NumLines = buf.size

arr = []

line_range.nil? ?  arr << "1-" : arr = line_range.split(',') 

arr.each do |r|
   from,to = parse_range(r)
   if from <= to
      for i in from..to
         if (nflag)
             printf("%4d %s", i, buf[i-1])
         else
             puts buf[i-1]
         end
      end
   else          
      while from >= to
         if (nflag)
             printf("%4d %s", from, buf[from-1])
         else
             puts buf[from-1]
         end
         from -= 1
      end
          
   end
end
