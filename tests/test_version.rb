#!/usr/bin/env ruby
# frozen_string_literal: true

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

  # test major: nil
  def test_nil
    version = ''
    @version.parse(version)
    assert_empty @version.as_list
  end

  # test to_s 1.2.3
  def test_to_s123
    version = '1.2.3'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(version, @version.to_s)
  end

  # test to_s 1
  def test_to_s1
    version = '1'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(version, @version.to_s)
  end

  # test to_s 1.0-SNAPSHOT
  def test_to_s10snapshot
    version = '1.0-SNAPSHOT'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(version, @version.to_s)
  end

  # test major: 1
  def test_major
    version = '1'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(1, @version.as_list.length)
    assert_equal(1, @version.as_list[0])
  end

  # test major and minor: 1.2
  def test_major_minor
    version = '1.2'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(2, @version.as_list.length)
    assert_equal(1, @version.as_list[0])
    assert_equal(2, @version.as_list[1])
  end

  # test major, minor and build: 1.2.3
  def test_major_minor_build
    version = '1.2.3'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(3, @version.as_list.length)
    assert_equal(1, @version.as_list[0])
    assert_equal(2, @version.as_list[1])
    assert_equal(3, @version.as_list[2])
  end

  # test snapshot: 1.0.0-SNAPSHOT
  def test_snapshot
    version = '1.0.0-SNAPSHOT'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(4, @version.as_list.length)
    assert_equal(1, @version.as_list[0])
    assert_equal(0, @version.as_list[1])
    assert_equal(0, @version.as_list[2])
    assert_equal('SNAPSHOT', @version.as_list[3])
  end

  # test patch: 3.2.1d
  def test_patch
    version = '3.2.1d'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(4, @version.as_list.length)
    assert_equal(3, @version.as_list[0])
    assert_equal(2, @version.as_list[1])
    assert_equal(1, @version.as_list[2])
    assert_equal('d', @version.as_list[3])
  end

  # test patch: 2.1d
  def test_short_patch
    version = '2.1d'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(3, @version.as_list.length)
    assert_equal(2, @version.as_list[0])
    assert_equal(1, @version.as_list[1])
    assert_equal('d', @version.as_list[2])
  end

  # test patch: 1.0-SNAPSHOT
  def test_short_snapshot
    version = '1.0-SNAPSHOT'
    @version.parse(version)
    refute_nil @version.as_list
    assert_equal(3, @version.as_list.length)
    assert_equal(1, @version.as_list[0])
    assert_equal(0, @version.as_list[1])
    assert_equal('SNAPSHOT', @version.as_list[2])
  end
end
