#!/usr/bin/env ruby
# coding: utf-8
# frozen_string_literal: true

# Load a properties file into a hash.
#
# Author:: Frank Jung
# License:: see LICENSE
class Properties
  # returns the complete properties file as a list
  attr_reader :as_list
  # returns just properties as a hash
  attr_reader :as_hash

  # Default constructor
  def initialize
    @as_list = []
    @as_hash = {}
  end

  # Parse a properties file
  #
  # * Load cleansed lines into an array
  # * Load key values into a hash
  def parse(file)
    raise unless File.file?(file)
    IO.foreach(file) do |line|
      work = line.strip
      next if work.empty?
      if '#' == work[0]
        @as_list << work
      elsif work.include? '='
        k, v = work.split('=', 2)
        _append k, v
      end
    end
  end

  private

  # write only valid properties to list and hash
  def _append(key, value)
    return unless key
    k = key.strip
    return unless k.length.positive?
    v = value ? value.strip : ''
    @as_hash[k] = v
    @as_list << k + '=' + v
  end
end
