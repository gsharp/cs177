#!/usr/bin/env ruby   
#                 
# Author:  Abbas Moghtanei
# Date  :  06/06/08        
# Program Name: bu.rb  (source code beautifier)
# This program re-arranges source codes to look better.

require "getoptlong"

#*********************************die()**********************************
def die(msg)
    puts("msg")
    File.unlink(infile)
    exit(1)
end

#********************************usage()*********************************
def usage()
   puts "---------------------------------------------------------------"
   puts "usage: #{__FILE__[2..__FILE__.size]} <options> filename"
   puts "\noptions are:"
   puts "-b or --backup: make a backup of the original file"
   puts "-h or --help: display this help"
   puts "-t tab size or --tab tab size: to specify the tabsize (4 is the"
   puts"default.)"
   puts "---------------------------------------------------------------"
   exit(0)
end

#********************************detab()*********************************
def detab(str, ts=Tab)
   while (l = str.index("\t")) != nil
      space = " " * (ts - (l % ts))
      str[l]= space
   end
   return(str)
end

#******************************is_comment()******************************
def is_comment(line, ext)
   if ext == "java" || ext == "c" || ext == "c++" || ext == "cpp"
      return(true) if line =~ /^\s*\/\*/ or line =~ /^\s*\/\//
   elsif ext == "pl" || ext == "perl" || ext == "ksh" || ext == "bash"
      return(true) if line =~ /^\s*#/
   elsif ext == "php"
      return(true) if line =~ /^\s*\/\*/
   else return(false)
   end
end
#########################################################################

opts = GetoptLong.new(
                       ["-b", "--backup" ,  GetoptLong::NO_ARGUMENT],
                       ["-h", "--help",     GetoptLong::NO_ARGUMENT],
                       ["-t", "--tab",      GetoptLong::REQUIRED_ARGUMENT]
                     )
bflag, hflag, tflag = false, false, false
tabsize = 4
begin
   opts.each do |opt, arg|
      case opt
         when "-h" 
            hflag = true
         when "-b" 
            bflag = true
         when "-t"
            tflag = true
            tabsize = arg
      end
   end
rescue => err
    #puts err
    exit(1)
end

usage() if hflag

Tab = tabsize.to_i
infile = ''

if ARGV.size > 0
   infile = ARGV.shift()
else
   abort "usage: #{__FILE__[2..__FILE__.size]} <options> filename"
end

abort "#{infile} does not exist\n" if !File.exists?(infile)

p = infile.rindex('.')
if (p != nil)
   ext   = infile[p+1,infile.size]
else
   #abort("Error: filename needs extension\n")
   ext   = "ksh"
end

abort "can not open #{infile} \n" if (fin = File.open(infile, "r")) == nil
outfile = infile + ".bu"
abort "#{outfile} already exist\n" if File.exists?(outfile)
abort "can not open #{outfile} \n" if (fout = File.open(outfile, "w")) == nil

if bflag
   backup_file = infile + ".bak" 
   cmd = "cp #{infile} #{backup_file}"
   system(cmd)
end

c = 0
while (( line = fin.gets ) != nil ) do
      line.chomp!.strip!
      line = detab(line) 

      if is_comment(line, ext) 
         fout.printf("%s%s\n", " "*c, line)
      elsif line['{'] == nil and line ['}'] == nil
         fout.printf("%s%s\n", " "*c, line)
      elsif line =~ /^(.*)\{(.*)\}(.*)$/
         fout.printf("%s%s\{%s\}%s\n", " "*c, $1, $2, $3)
      elsif line =~ /^(.*)\}(.*)\{(.*)$/
         fout.printf("%s%s\n", " "*c, $1.strip!) if $1 != ''
         c -= Tab if c >= Tab
         fout.printf("%s\}\n", " "*c)
         fout.printf("%s%s\n", " "*c, $2.strip!)
         fout.printf("%s\{\n", " "*c)
         c += Tab
         fout.printf("%s%s\n", " "*c, $3.strip!) if $3 != ''
      elsif line =~ /^(.*)\{(.*)$/
         fout.printf("%s%s\n", " "*c, $1) if $1 != ''
         fout.printf("%s\{\n", " "*c)
         c += Tab
         fout.printf("%s%s\n", " "*c, $2) if $2 != ''
      elsif line =~ /^(.*)\}(.*)$/
         fout.printf("%s%s\n", " "*c, $1) if $1 != ''
         c -= Tab if c >= Tab
         fout.printf("%s\}%s\n", " "*c, $2) 
      else
         fout.printf("%s%s\n", " "*c, line)
      end
end 
      
fout.close(); fin.close()
File.rename(outfile, infile)
exit(0)

