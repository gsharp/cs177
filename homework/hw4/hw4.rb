#!/usr/local/bin/ruby1.9 -w
#                 
# Author:  Glen Cuthbertson
# Date  :  10/20/2009
# Program Name: hw4.rb
#   - make file of 20,000 random ip addresses
#   - remove duplicate ip's
#   - report which id's were duplicated + how many times
#   - make file of non duplicated ips
#   - report math/proof to validate comparrison between files and calculations of dupes
# Note: This program works only on ruby 1.9 and above.

#*******************************class IpList(targetSize)*******************************
# to practice encapsulation
class IpList
  #*******************************initialize()*******************************
  # in: takes integer for targetSize of ip list
  def initialize (targetSize)
    @ipCountStart = 1
    @ipCountStop  = targetSize
  end

  #*******************************createIps(fileName)*******************************
  # in  : filename
  # proc: populates a file with 1 ip per line upto @ipCountStop
  # out : file name created
  def createIps (fileName)
    lineCount = 0
    ipMax = 255
    file = File.new(fileName, "w+")
    (@ipCountStart..@ipCountStop).each do 
      ip = ""
      4.times do |i| 
        ip += (1+rand(ipMax)).to_s
        ip += '.' if i < 3
      end
      #write IP's to file
      file.puts ip
      lineCount += 1
    end
    file.close
    puts "  #{lineCount} random Ip's written to #{file.path}"
    return file.path
  end

  #*******************************findUniqueLines(fileName)*******************************
  # in  : name of file to query
  # proc: reads the ip file and populates a global hash of unique ip's
  # out : returns hash of unique ip's  
  def findUniqueLines(fileName)
    hash = {}
    file = File.open(fileName, "r+")
    file.each do |line|
      line.chomp!
      # create unique ip hash tracking repeats as values
      hash[line].nil? ? hash[line] = 1 : hash[line] +=1
    end
    file.close
    return hash # returns hash of unique ip's
  end

  #*******************************findDupes()*******************************
  # relies on hash convention: key => #ofdupes
  # in  : hash of unique ip's with tracked dupes: convention is key => #ofdupes
  # proc: store dupe values
  # out : returns hash of dupe ip's
  def findDupes (hash)
    dupedIps = {}
    hash.each {|k,v| dupedIps[k] = v if v > 1}
    return dupedIps # returns hash of dupes only
  end

  #*******************************storeFromHash (fileName,hash,dupes=false)*******************************  
  # returns closed file
  # in  : new filename, findDupes hash
  # proc: writes each line to file
  # out : returns new file path, lines written
  def storeFromHash (fileName,hash,dupes=false)
    lineCount = 0
    file = File.new(fileName, "w+")
    hash.each do |k,v|
      if dupes
        file.puts "  #{k} repeated #{v} times" if v > 1
      else
        file.puts k
      end
      lineCount += 1
    end           
    file.close
    puts "  #{lineCount} lines written to #{file.path}"
    return file.path, lineCount
  end 

  #*******************************readFile (fileName)*******************************  
  # outputs lines and returns lineCount
  # in  : filename
  # proc: puts each line
  # out : returns linecount
  def readFile (fileName)
    lineCount = 0
    file = File.open(fileName, "r+") 
    file.each {|line| puts line; lineCount += 1}
    file.close
    return lineCount
  end


  #*******************************doMath(ipCount,dupeCount)*******************************
  # in  : unique ipCount size, dupe ip Count size
  # proc: output validating proof
  # out : returns true if validation matches list size
  def doMath(uniqueIps,dupeCount)
    puts "  target list size:                #{@ipCountStop}"
    puts "  Unique Ips:                      #{uniqueIps}"
    puts "  Duplicated Ip's aggregate total: #{dupeCount}"
    puts "  Unique Ip's + Dupped Ip's:       #{uniqueIps + dupeCount}"
    return (uniqueIps + dupeCount == @ipCountStop)
  end
end # class IpList

#*******************************doHomework(listSize)*******************************
# i: take integer representing list size from argument (default at 20000)
# goes thru reqreuiment list and reports results
def doHomework (listSize)
  mainIpFile  = "ip_addresses.txt"
  dupedIpFile = "ip_dupes.txt"
  hw4 = IpList.new listSize
  puts "1) generating ip master list"
  hw4.createIps mainIpFile

  puts "2) generating unique ip's from file #{mainIpFile}"
  uniqueIpHash = hw4.findUniqueLines mainIpFile
  puts "  there are #{uniqueIpHash.size} UNIQUE Ip's"

  puts "3) looking for duplicated ip's"
  dupedIps = hw4.findDupes uniqueIpHash
  if dupedIps.size > 0
    puts "  #{dupedIps.size} ip's were duplicated...writing them to a file"
    hw4.storeFromHash dupedIpFile,dupedIps,true
    puts "4) reading #{dupedIpFile}"
    linesRead = hw4.readFile dupedIpFile
    puts "  #{linesRead} lines read from #{dupedIpFile}"
    puts "5) replacing #{mainIpFile} with non duplicate IP's"
    hw4.storeFromHash mainIpFile,uniqueIpHash
    puts "6) math validation"
    didItWork = hw4.doMath uniqueIpHash.size, dupedIps.size
    puts "  validation is: #{didItWork}"
  else
    puts "no dupes found"
  end
end

doHomework ARGV[0].to_i > 0 || 20000