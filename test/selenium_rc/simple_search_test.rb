require File.dirname(__FILE__) + '/../test_helper'
require 'test/unit'
require 'selenium'

class SimpleSearchTest < Test::Unit::TestCase
  include SeleniumTestHelper
  sleep 2
  
  def setup
    setup_with_selenium
	end

	def teardown
	  terminate_servers
	end
  
  def test_simple_search_test
    open "/nature/forests"
    wait_for_page_to_load "3000"
    click "link=Search"
    type "nature__forests-search-input", "b"
    click "commit"
    begin
        assert is_text_present("nebo")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert is_text_present("beaver")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert !is_text_present("wasatch")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
  end
end
