require File.dirname(__FILE__) + '/../test_helper'
require 'test/unit'
require 'selenium'

class GemTest < Test::Unit::TestCase
   
  ## This works with selenium_rc plugin or selenium gem
  ## Requires that app is running at localhost:3000 -> script/server
  ## and if using gem -> selenium
  def setup
		@sel = Selenium::SeleniumDriver.new("localhost", 4444, "*firefox", "http://localhost:3000", 15000)
		@sel.start
	end

	def test_google
		@sel.open("/users")
		@sel.wait_for_page_to_load("5000")
		assert_equal("hello world - Google Search", @sel.get_title())
	end

	def teardown
		@sel.stop
	end
end
