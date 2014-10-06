#!/usr/bin/env ruby

# Test version.
#
# Author:: Frank Jung
# License:: see LICENSE
require_relative '../lib/version'
require 'minitest'
require 'minitest/autorun'

# Test Version class.
#
# = References
#
# * Tested with:
#
#   ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-linux]
#
# * MiniTest:
#
#   https://github.com/seattlerb/minitest
#
class TestVersion < Minitest::Test
  # create version class
  def setup
    @version = Version.new
    assert_instance_of(Version, @version)
  end

  # test major: 1
  def test_major
    version = '1'
    @version.parse(version)
    refute_nil @version.as_list
    refute_nil @version.as_hash
    assert_equal(1, @version.as_list.length)
    assert_equal(1, @version.as_hash['major'])
    assert_nil(@version.as_hash['minor'])
    assert_nil(@version.as_hash['build'])
  end

  # test major and minor: 1.2
  def test_major_minor
    version = '1.2'
    @version.parse(version)
    refute_nil @version.as_list
    refute_nil @version.as_hash
    assert_equal(2, @version.as_list.length)
    assert_equal(1, @version.as_hash['major'])
    assert_equal(2, @version.as_hash['minor'])
    assert_nil @version.as_hash['build']
    assert_nil @version.as_hash['patch']
  end

  # test major, minor and build: 1.2.3
  def test_major_minor_build
    version = '1.2.3'
    @version.parse(version)
    refute_nil @version.as_list
    refute_nil @version.as_hash
    assert_equal(3, @version.as_list.length)
    assert_equal(1, @version.as_hash['major'])
    assert_equal(2, @version.as_hash['minor'])
    assert_equal(3, @version.as_hash['build'])
    assert_nil @version.as_hash['patch']
  end

  # test snapshot: 1.0.0-SNAPSHOT
  def test_snapshot
    version = '1.0.0-SNAPSHOT'
    @version.parse(version)
    refute_nil @version.as_list
    refute_nil @version.as_hash
    assert_equal(3, @version.as_list.length)
    assert_equal(1, @version.as_hash['major'])
    assert_equal(0, @version.as_hash['minor'])
    assert_equal(0, @version.as_hash['build'])
    assert_equal('-SNAPSHOT', @version.as_hash['patch'])
  end

  # test patch: 3.2.1d
  def test_patch
    version = '3.2.1d'
    @version.parse(version)
    refute_nil @version.as_list
    refute_nil @version.as_hash
    assert_equal(3, @version.as_list.length)
    assert_equal(3, @version.as_hash['major'])
    assert_equal(2, @version.as_hash['minor'])
    assert_equal(1, @version.as_hash['build'])
    assert_equal('d', @version.as_hash['patch'])
  end

  # test patch: 2.1d
  def test_patch
    version = '2.1d'
    @version.parse(version)
    refute_nil @version.as_list
    refute_nil @version.as_hash
    assert_equal(2, @version.as_list.length)
    assert_equal(2, @version.as_hash['major'])
    assert_equal(1, @version.as_hash['minor'])
    assert_equal('d', @version.as_hash['build'])
    assert_equal(nil, @version.as_hash['patch'])
  end
end
