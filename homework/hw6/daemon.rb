#!/usr/local/bin/ruby1.9 -w
# 
#  daemon.rb
#  daemon app
#  -reads a config
#  -runs child processes
#
#  Created by apple on 2009-11-04.
#  Copyright 2009 glen.com All rights reserved.
# 

require 'rexml/document'

config = REXML::Document.new(File.open("config.xml"))
configHash = {}
# config xml to hash
config.elements.each("//key") {|k| k.attributes.each {|a,v| configHash[a] = v}}
# output hash
configHash.each {|k,v| puts "#{k}: #{v}"}
p configHash