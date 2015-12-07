#!/usr/bin/env ruby
# coding: utf-8

require_relative 'lib/properties'
require 'trollop'

#
# Command line options
#
opts = Trollop.options do
  version "#{File.basename($PROGRAM_NAME)} 0.1.0 © 2013 Frank H Jung"
  banner <<-USAGE

  NAME

  #{File.basename($PROGRAM_NAME)} - property file processing example

  SYNOPSIS

  #{File.basename($PROGRAM_NAME)} [options] <filename>

  OPTIONS

  USAGE
  opt :verbose, 'Verbose output', default: false, short: '-v'
  opt :file, 'name of properties file to read',
      default: 'test.properties', short: '-f', type: String
end

#
# MAIN
#

Trollop.die :file, 'must exist' if opts[:file] && !File.exist?(opts[:file])

# load Employees data from XML
properties = Properties.new
properties.parse(opts[:file])

# list
puts 'Show as list:'
puts properties.as_list

# hash
hash = properties.as_hash
puts 'Show in key order:'
keys = hash.keys.sort
keys.each { |k| puts k + '=' + hash[k] }

puts 'Show in value order:'
inverted = hash.invert
values = inverted.keys.sort
values.each { |v| puts inverted[v] + '=' + v }
