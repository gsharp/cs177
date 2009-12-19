#!/usr/local/bin/ruby1.9 -w
#  CS177
#  hw7.rb
#  report the followying system properties at runtime:
#    def memsize()
#    def cpunums()
#    def cpuvendor()
#    def cpu_model
#    def cpu_speed
#    def osname()
#    def macnum()
#    def swapsize()
#  
#  Created by Glen Cuthbertson on 2009-12-18.
#  Copyright 2009 glenc.com. All rights reserved.
# 

require "sys/cpu"
include Sys

class SysInfo
  #******************************* initialize() *******************************
  # setup main constants and data for profiler methods
  def initialize
    # setup and store system info into hash
    @sysHash = {}
    # uses system_profiler to determin hardware and software data
    @sys = `system_profiler SPHardwareDataType SPSoftwareDataType`
    @sys = @sys.scan(/(\S.*):(.*)/)
    # set data to a hash
    @sys.each {|i| @sysHash[i[0]] = i[1]}

    # uses system_profiler to determine network info
    @net = `system_profiler SPNetworkDataType | grep MAC`
    @net = @net.split("\n") # store as array

    # uses du to determine swapfile sizes
    @swapsize = `du -h -I sleepimage /var/vm`.split(' ')
  end

  #******************************* memsize() *******************************
  # get RAM memory size installed on computer
  def memsize
    "Memory size: #{@sysHash["Memory"]}"
  end

  #******************************* cpunums() *******************************
  # checks for number of cpu's on computer
  def cpunums
    "Number of cpu's on this system: #{CPU.num_cpu} \(#{@sysHash['Number Of Processors'].strip} Processor, #{@sysHash['Total Number Of Cores'].strip} Cores\)"    
  end

  #******************************* cpuvendor() *******************************
  # gets the vendor name of the cpu
  def cpuvendor
    "CPU Vendor: #{@sysHash["Processor Name"].split(' ')[0]}" 
  end

  #******************************* cpu_model() *******************************
  # gets the model name of the cpu  
  def cpu_model
    "CPU model: #{@sysHash["Processor Name"]}"
  end

  #******************************* cpu_speed() *******************************
  # gets the cpu speed
  def cpu_speed
    "CPU speed: #{@sysHash["Processor Speed"]}"
  end

  #******************************* osname() *******************************
  # gets the OS name  
  def osname
    "OS name: #{@sysHash["System Version"]}, Kernel: #{@sysHash["Kernel Version"]}"
  end

  #******************************* swapsize() *******************************
  # determines the size of aggregate swap files  
  def swapsize
    "Swap file size: #{@swapsize[0]}" 
  end

  #******************************* macnum() *******************************
  # gets all mac addresses used for this machine
  def macnum
    puts "Total MAC Addresses (Ethernet / Firewire / Airport):"
    @net.each {|i| puts i}
  end
  
  #******************************* abbasProfile() *******************************
  # executes a profile given by Abbas for homework 7  
  def abbasProfile
    # @sysHash.each {|k,v| puts "#{k} : #{v}"}
    puts "----------------Abbas system profile for OSX (CS177 Homework 7, by Glen Cuthbertson)--------"
    puts "----------------these drivers were executed on a MacBook Pro running OSX Snow Leopard-------"
    puts memsize
    puts cpunums
    puts cpuvendor
    puts cpu_model
    puts cpu_speed
    puts osname
    puts swapsize
    macnum
  end
end

hw7 = SysInfo.new
hw7.abbasProfile