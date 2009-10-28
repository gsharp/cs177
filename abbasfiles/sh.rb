#!/usr/bin/env ruby   
#                 
# Author:  Abbas Moghtanei
# Date  :  05/25/08        
# Program Name: sh.rb 
# This program creates comment line header for each function in the file                        
require "getoptlong"

$function_name=""

##################################parse_java()###############################
def parse_java(xline)
  return (false) if xline =~ /^\/\//   || xline =~ /^\/\*/ || 
                    xline =~ /;$/      || (xline =~ /(.*)/) == nil ||
                    xline =~ /=.*(.*)/ || xline =~ /^\}/
   
  
  return (false) if (xline =~ /^.*\s+(\w+)(\(.*\))/) == nil
  $function_name=$1
  return(true)
end
###################################parse_c()#################################
def parse_c(xline)
  return (false) if xline =~ /^\/\//   || xline =~ /^\/\*/ || 
                    xline =~ /=.*(.*)/ || xline =~ /;$/    ||
                    xline =~ /^\}/      ||
                   (xline =~ /^.*\s+(\w+)(\(.*\))/) == nil
  $function_name=$1
  return(true)
end  
#################################parse_ruby()################################
def parse_ruby(xline)
  return (false) if xline =~ /^#/ || (xline =~ /^def\s+(\w+)/) == nil
  $function_name=$1
  return(true)
end 
#################################parse_lua()#################################
def parse_lua(xline)
  return (false) if xline =~ /^--/ ||
                    (xline =~ /^function\s+(\w+)/) == nil
  $function_name=$1
  return(true)
end 
#################################parse_php()#################################
def parse_php(xline)
  return (false) if xline =~ /^\/\*/ || xline =~ /^\}/ ||
                   (xline =~ /^function\s+(\w+)/) == nil
  $function_name=$1
  return(true)
end 
###############################parse_python()################################
def parse_python(xline)
  return (false) if xline =~ /^#/ || (xline =~ /^def\s+(\w+)/) == nil
  $function_name=$1
  return(true)
end 
################################parse_perl()#################################
def parse_perl(xline)
  return (false) if xline =~ /^#/ || xline =~ /^\}/
  return (false) if (xline =~ /^sub\s+(\w+)/) == nil
  $function_name=$1
  return(true)
end 
################################parse_shell()################################
def parse_shell(xline)
  return (false) if xline =~ /^#/ || xline =~ /=/
  #return (false) if (xline =~ /^function\s+(\w+)/) == nil 
  return (false) if (xline =~ /^(\w+)\s*\(\)/) == nil
  $function_name=$1
  return(true)
end 
################################get_ext()####################################
def get_ext(language)
   ext = case language
     when "java"
          language
     when "c++"
          language 
     when "cpp"
          language 
     when "ruby"
          "rb"
     when "lua"
          language
     when "php"
          language
     when "python"
          "py"
     when "ksh"
          language
     when "bash"
          language
     when "perl"
          language
     when "sh"
          language
     else  
          abort("can not handle this language: #{language}\n")
   end
   return(ext)
end
##################################usage()####################################
def usage()
   puts "--------------------------------------------------------------"
   puts "usage: #{__FILE__[2..__FILE__.size]} <options> filename"
   puts "\noptions are:"
   puts "-b or --backup: make a backup of the original file"
   puts "-d or --display: display the function header"
   puts "-h or --help: display this help"
   puts "-l language  or --language language: specify the language"
   puts "   The language is one of the following:"
   puts "   c, c++, cpp, ksh, bash, sh, java, ruby, python, php, lua, perl"
   puts "-n or --numfunc: display number of functions in the file"
   puts "-s or --setheader: set header for functions"
   puts "\nnote: please make sure to use -s if you want to set header"
   puts "for your functions."
   puts "--------------------------------------------------------------"
   exit(0)
end

opts = GetoptLong.new(
                       ["-b", "--backup" ,  GetoptLong::NO_ARGUMENT],
                       ["-d", "--display",  GetoptLong::NO_ARGUMENT],
                       ["-h", "--help",     GetoptLong::NO_ARGUMENT],
                       ["-l", "--language", GetoptLong::REQUIRED_ARGUMENT],
                       ["-n", "--numfunc",  GetoptLong::NO_ARGUMENT],
                       ["-s", "--setheader",GetoptLong::NO_ARGUMENT]
                     )
bflag,dflag,hflag,lflag,nflag,sflag = false,false,false,false,false,false

language = nil
fcount = 0
begin
   opts.each do |opt, arg|
      case opt
         when "-h" 
            hflag = true
         when "-b" 
            bflag = true
         when "-d" 
            dflag = true
         when "-l" 
            lflag = true
            language = arg
         when "-n" 
            nflag = true
         when "-s" 
            sflag = true
      end
   end
rescue => err
    #puts err
    exit(1)
end

usage() if hflag

if ARGV.size > 0
   infile = ARGV.shift()
else
   abort "usage: #{__FILE__[2..__FILE__.size]} <options> filename"
end


abort "#{infile} does not exist\n" if !File.exists?(infile)

p = infile.rindex('.')
if (p != nil)
   fname = infile[0..p-1]
   ext   = infile[p+1,infile.size]
else
   fname = infile
   ext = lflag ? get_ext(language) : "ksh"  
end

if (ext == "pl" || ext == "pm" || ext == "perl" )
   start_char = '#'
   end_char   = '*'
elsif (ext == 'rb')
   start_char = '#'
   end_char   = '*'
elsif (ext == 'php')
   start_char = '/*'
   end_char   = '*'
elsif (ext == 'py')   
   start_char = '#'
   end_char   = '*'
elsif (ext == 'lua')
   start_char = '--'
   end_char   = '*'
elsif (ext == 'java')
   start_char = '//'
   end_char   = '*'
elsif (ext == 'c' || ext == 'cpp' || ext == 'c++')
   start_char = '//'
   end_char   = '*'
elsif (ext == 'sh' || ext == 'ksh' || ext == 'bash')
   start_char = '#'
   end_char   = '*'
else
   start_char = '#'
   end_char   = '*'
end

 
abort "can not open #{infile} \n" if (fin = File.open(infile, "r")) == nil
outfile = infile + ".out"
abort "#{outfile} already exist\n" if File.exists?(outfile)
abort "can not open #{outfile} \n" if (fout = File.open(outfile, "w")) == nil

if bflag
   backup_file = infile + ".bak" 
   cmd = "cp #{infile} #{backup_file}"
   system(cmd)
end

while (( line = fin.gets ) != nil ) do
      line.chomp!
      xline = line.strip().squeeze(' ')

      is_function = case ext
         when "pl" 
            parse_perl(xline)
         when "pm" 
            parse_perl(xline)
         when "perl" 
            parse_perl(xline)
         when "rb"
            parse_ruby(xline)
         when "py"
            parse_python(xline)
         when "php"
            parse_php(xline)
         when "java"
            parse_java(xline)
         when "c"
            parse_c(xline)
         when "cpp"
            parse_c(xline)
         when "c++"
            parse_c(xline)
         when "ksh"
            parse_shell(xline)
         when "bash"
            parse_shell(xline)
         when "sh"
            parse_shell(xline)
         else      
            abort "unknown programming language #{ext}"
       end
    
         if (is_function) then
            fcount += 1 if nflag
            #print "function_name:#$function_name", "\n"
            $function_name += '()'
            xline = $function_name.center(72, end_char)
            xline = start_char + xline 
            xline += "/" if ext == "php"
            print xline, "\n"  if dflag
            fout.print xline, "\n" if sflag
         end
      fout.print line, "\n"
end
print "Number of functions: #{fcount}\n" if nflag 
fin.close(); fout.close() 
File.rename(outfile, infile)
      
