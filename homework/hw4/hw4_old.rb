#!/usr/local/bin/ruby1.9 -w
#                 
# Author:  Glen Cuthbertson
# Date  :  10/10/2009
# Program Name: hw4.rb
#   - make file of 20,000 random ip addresses
#   - remove duplicate ip's
#   - report which id's were duplicated + how many times
#   - make file of non duplicated ips
#   - report math/proof to validate comparrison between files and calculations of dupes
# Note: This program works only on ruby 1.9 and above.

# TODO
# copy $origFile to $fileWithDupes
# read from file into hash to dedupe
# create a file containing the output of the generated ips called "ip addresses"
# display a listing of repeated address and how many times each repeated
# remove all duplicates and put result back into the same "ip addresses"
# calculate how many ip's are left and compare with the difference: output
# output duplicate ip's with their count

# variables
$ipCountStart = 1
$ipCountStop  = 100000
$ipHash       = {}
$origFile     = File.new('ip_addresses.txt', "w+")
$fileWithDupes= File.new('ips_with_dupes.txt', "w+")
$fileOfDupes  = File.new('dupe_ips.txt', "w+")

#*******************************createIps()*******************************
def createIps
  taskDiv "1) creating the Ip's"
  puts "Generating #{$ipCountStop} ip addresses and putting them into #{$origFile.path}"

  ipMax = 255
  ($ipCountStart..$ipCountStop).each do 
    ip = ""
    4.times do |i| 
      ip += (1+rand(ipMax)).to_s
      ip += '.' if i < 3
    end
    #write 20k to orig file
    $origFile.puts ip
    # create unique ip hash tracking repeats as values
    $ipHash[ip].nil? ? $ipHash[ip] = 1 : $ipHash[ip] +=1
  end

  $origFile.rewind
  $origIpCount = $origFile.readlines.size
  puts "#{$origFile.path} line total is #{$origIpCount}"

  taskDiv "2) determining unique ip's"
  puts "#{$ipHash.size} unique IP addresses were generated"

  $ipHash.size < $ipCountStop ? dealWithDupes : (puts "done...there were no dupes to process")
end 

#*******************************dealWithDupes()*******************************
def dealWithDupes
  uniqueIpHash = {}
  $ipHash.each {|k,v| uniqueIpHash[k] = v if v > 1}

  taskDiv "3) put unique ip's into #{$fileWithDupes.path}"
  $ipHash.each {|k,v| ($fileWithDupes.puts "#{k} repeated #{v} times") if v > 1}
  $fileWithDupes.rewind
  fileWithDupesLineCount = $fileWithDupes.readlines.size
  puts "#{$fileWithDupes.path} line total is #{fileWithDupesLineCount}"

  taskDiv "4) show the duped ip's from #{$fileWithDupes.path}"
  $fileWithDupes.rewind
  $fileWithDupes.each_line {|line| puts line}

  taskDiv "5) put unique ip's back into original file"
  $origFile.rewind
  $ipHash.each {|k,v| $origFile.puts k if v > 1} # put back into original deduped
  puts "#{$origFile.path} line total is #{$origFile.readlines.size}"

  doMath $origIpCount, fileWithDupesLineCount

end

#*******************************doMath(ipCount,dupeCount)*******************************
def doMath(ipCount,dupeCount)
  taskDiv "6) validate unique count - duped ip's = total ip's generated"
  puts "ipCount:   #{ipCount}"
  puts "dupeCount: #{dupeCount}"
  puts "ipCount - dupeCount = #{ipCount - dupeCount}"  
end

#*******************************taskDiv(task)*******************************
def taskDiv task
  puts
  puts "------------ #{task}"
end

createIps