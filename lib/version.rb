#!/usr/bin/env ruby
# coding: utf-8

# Process a version number.
#
# Author:: Frank Jung
# License:: see LICENSE
class Version
  # returns version as a list
  attr_reader :as_list

  # Default constructor
  def initialize
    @as_list = []
  end

  # Parse a version string into an array
  def parse(version)
    return unless version
    version.strip.split(/\W+/).each do |part|
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
