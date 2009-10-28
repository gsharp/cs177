#!/usr/local/bin/ruby -w
#                 
# Author:  Glen Cuthbertson
# Date  :  10/28/2009
# Program Name: hw5.rb
#   - make driver to test C extended functions via swig

require 'cs177'
$testCount = 1
def testIt(msg,output,input)
  delim = $testCount.to_s + ") " + msg
  puts delim
  puts
  puts "  input  :   " + input
  puts "  output : \"" + output + "\""
  puts
  $testCount += 1
end

def doTests
  testString = "test_string_reference"
  
  testCases = {}
  testCases[1] = "Cs177.strsuffix(\""+testString+"\",\"_suffix_\")"
  testCases[2] = "Cs177.strdel(\""+testString+"\",\"string\")"
  testCases[3] = "Cs177.strprefix(\""+testString+"\",\"_prefix_\")"
  testCases[4] = "Cs177.strrpt(\""+testString+"\",10)"
  testCases[5] = "Cs177.strsub(\""+testString+"\",5,6)"
  testCases[6] = "Cs177.strrtrim(\" "+testString+" \")"
  testCases[7] = "Cs177.strltrim(\" "+testString+" \")"
  
  puts "Ruby Test Driver for cs177.c"
  puts "the following functions will be run:"
  testCases.sort.each {|k,v| puts "  #{k}) #{v}"}
  puts

  testIt "char *strsuffix(char *s, char *t);",       Cs177.strsuffix( testString,"_suffix_"),    testCases[1]
  testIt "char *strdel(char *s, char *t);",          Cs177.strdel(    testString,"string"),      testCases[2]
  testIt "char *strprefix(char *s, char *t);",       Cs177.strprefix( testString,"_prefix_"),    testCases[3]
  testIt "char *strrpt(char *s, int n);",            Cs177.strrpt(    testString,10),            testCases[4]
  testIt "char *strsub(char *s, int loc, int len);", Cs177.strsub(    testString,5,6),           testCases[5]
  testIt "char *strrtrim(char *s);",                 Cs177.strrtrim(  " test_string_reference "),testCases[6]
  testIt "char *strltrim(char *s);",                 Cs177.strltrim(  " test_string_reference "),testCases[7]
end

doTests