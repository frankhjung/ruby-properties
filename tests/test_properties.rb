#!/usr/bin/env ruby

# Test properties.
#
# Author:: Frank Jung
# License:: see LICENSE
require_relative '../lib/properties'
require 'minitest'
require 'minitest/autorun'
# require 'version'

# Test Properties class.
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
class TestProperties < Minitest::Test
  # create properties class
  def setup
    @properties = Properties.new
    assert_instance_of(Properties, @properties)
    file = File.expand_path('../data/test.properties', File.dirname(__FILE__))
    @properties.parse(file)
  end

  # load of bad file
  def test_bad_file
    file = 'bad_file'
    assert_raises RuntimeError do
      @properties.parse(file)
    end
  end

  # test list parsed correctly
  def test_list
    refute_nil @properties.as_list
    assert_equal(11, @properties.as_list.count)
    assert_includes(@properties.as_list, 'method.e.version=1.0.0-SNAPSHOT')
    assert_includes(@properties.as_list, 'method.u.version=')
    refute_includes(@properties.as_list, '=3.14.15')
  end

  # test hash parsed correctly
  def test_hash
    refute_nil @properties.as_list
    assert_equal(8, @properties.as_hash.length)
    assert_includes(@properties.as_hash.keys, 'method.g.version')
    assert_equal(@properties.as_hash['method.b.version'], '1.2.3')
    refute_includes(@properties.as_hash.values, '3.14.15')
  end
end
