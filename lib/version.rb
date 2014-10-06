#!/usr/bin/env ruby
# coding: utf-8

# Process a version number.
#
# Author:: Frank Jung
# License:: see LICENSE
class Version
  # default delimiter in version
  DELIMITER = '.'
  # default maximum partitions in version
  MAXIMUM_SEGMENTS = 3
  # returns the version as a list (major, minor, build)
  attr_reader :as_list
  # returns just version as a hash (major, minor, build)
  attr_reader :as_hash

  # Default constructor
  def initialize
    @as_list = []
    @as_hash = { major: nil, minor: nil, build: nil, patch: nil }
  end

  # Parse a version where delimiters are '.'
  def parse(version)
    fail unless version
    @as_list = version.strip.split(DELIMITER, MAXIMUM_SEGMENTS)
    list_to_hash
  end

  private

  # map list to hash
  # * must have at least a major version
  # * should have a minor version
  def list_to_hash
    return unless @as_list
    set_major
    set_minor
    set_build
  end

  # set major
  def set_major
    fail unless @as_list[0]
    @as_hash['major'] = Integer @as_list[0]
  end

  # set minor
  def set_minor
    return unless @as_list[1]
    begin
      @as_hash['minor'] = Integer @as_list[1]
    rescue
      minor = /(\d*)(\D*)/.match(@as_list[1])
      @as_hash['minor'] = minor[1].to_i if minor[1]
      # not sure if this should be a patch
      @as_hash['build'] = minor[2] if minor[2]
    end
  end

  # set build and optionally a patch`
  def set_build
    return unless @as_list[2]
    begin
      @as_hash['build'] = Integer @as_list[2]
    rescue
      build = /(\d*)(\D*)/.match(@as_list[2])
      @as_hash['build'] = build[1].to_i if build[1]
      @as_hash['patch'] = build[2].strip if build[2]
    end
  end
end
