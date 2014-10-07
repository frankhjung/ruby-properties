#!/usr/bin/env ruby
# coding: utf-8

# Process a version number.
#
# To Do
#
# * add (static) compare operators
#   where SNAPSHOT below equivalent release version
#
# Author:: Frank Jung
# License:: see LICENSE
class Version
  # returns version as a list
  attr_reader :as_list
  # return version
  # attr_reader :version

  # Default constructor
  def initialize
    @as_list = []
    @version = ''
    @separators = []
  end

  # Parse a version string into an array
  def parse(version)
    fail unless version
    @version = version.strip
    _split_into_delimiters
    _split_into_parts
  end

  # Rebuild version from parts
  #
  # Can return just original version but I wanted to tests re-building the
  # version from its parts.
  def to_s
    return @as_list.join if @separators.empty?
    work = []
    @separators.each_index do |i|
      work << @as_list[i]
      work << @separators[i]
    end
    work << @as_list.slice(@separators.size..@as_list.size)
    work.join
  end

  private

  # Save delimeters as a list
  def _split_into_delimiters
    @version.chars.each do |c|
      @separators << c if /(\W)/.match(c)
    end
  end

  # Split version into a list
  def _split_into_parts
    @version.split(/\W+/).each do |part|
      if !part
        next
      elsif /^(\d+)$/.match(part)
        @as_list << part.to_i
      elsif /^(\d+)(\D*)$/.match(part)
        parts = /^(\d+)(\D*)$/.match(part)
        @as_list << parts[1].to_i
        @as_list << parts[2]
      else
        @as_list << part
      end
    end
  end
end
