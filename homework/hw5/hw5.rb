#!/usr/local/bin/ruby -w
#                 
# Author:  Glen Cuthbertson
# Date  :  10/28/2009
# Program Name: hw5.rb
#   - make driver to test C extended functions via swig
# NOTE: this app is running on ruby1.8 for swig compatability

# pull in the swig extended C module
require 'cs177' 

#********************************doTests()*****************************
# defines unit tests
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
  puts

  testIt "char *strsuffix(char *s, char *t);",       testCases[1]
  testIt "char *strdel(char *s, char *t);",          testCases[2]
  testIt "char *strprefix(char *s, char *t);",       testCases[3]
  testIt "char *strrpt(char *s, int n);",            testCases[4]
  testIt "char *strsub(char *s, int loc, int len);", testCases[5]
  testIt "char *strrtrim(char *s);",                 testCases[6]
  testIt "char *strltrim(char *s);",                 testCases[7]
end

#********************************testIt(msg,test)*****************************
# executes tests
$testCount = 1
def testIt(msg,test)
  title = $testCount.to_s + ") " + msg
  puts title
  puts
  puts "  input  : " + test
  puts "  output : \"" + eval(test) + "\""
  puts
  $testCount += 1
end

doTests