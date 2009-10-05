#!/usr/local/bin/ruby1.9 -w

=begin
  lists lines from file src
  usage: ./test script_file script_input
=end
abort "usage: ./test script_file script_input" if ARGV.length < 2
script = "./#{ARGV[0]} "
puts "############# RUNNING TEST SUITE FOR: #{script} #####################"
testFile = ARGV[1]
testHash = 
{
"no arguments / params"                                         =>"",
"good file, no lines"                                           => testFile,
"bogus file"                                                    => "foo.src",
"good file, show lines"                                         =>"-n #{testFile}",
"good file, bogus line option"                                  =>"-fii #{testFile}",
"good file, single numb range"                                  =>"3 #{testFile}",
"good file, multi range"                                        =>"3,4-20,5 #{testFile}",
"good file, multi range, last line -"                           =>"3,4-20,5- #{testFile}",
"good file, multi range, last line $"                           =>"3,4-20,5-$ #{testFile}",
"good file, multi range, last line $ only"                      =>"3,4-20,5,$ #{testFile}",
"good file, single num range, show lines"                       =>"-n 3 #{testFile}",
"good file, multi range, show lines"                            =>"-n 3,4-20,5 #{testFile}",
"good file, multi range, last line -, show lines"               =>"-n 3,4-20,5- #{testFile}",
"good file, multi range, last line $, show lines"               =>"-n 3,4-20,5-$ #{testFile}",
"good file, multi range, last line $ only, show lines"          =>"-n 3,4-20,5,$ #{testFile}"
}
puts "Running #{testHash.size} tests:"
puts
testCount = 0
testHash.each do |k,v|
  testCount += 1
  puts "#{testCount})==============> Tests: #{k}"
  puts "command:         " + script + v
  puts "--outpput--     "
  system(script + v)
  puts 
end