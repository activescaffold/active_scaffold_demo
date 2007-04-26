require File.dirname(__FILE__) + '/../test_helper'
require 'test/unit'
require 'selenium'

class RcTest < Test::Unit::TestCase
   include SeleniumTestHelper
   sleep 2
   
  ## This works with selenium_rc
  ## TODO - Need to make the following configurable
  ##  -fN 
  ##  port
  ## TODO - Automate more of this
  def setup
    setup_with_selenium
	end

	def test_google
		open("/users")
		wait_for_page_to_load("5000")
		#assert_equal("hello world - Google Search", @sel.get_title())
	end

	def teardown
	  terminate_servers
	end
end
