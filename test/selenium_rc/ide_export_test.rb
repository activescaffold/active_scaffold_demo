require File.dirname(__FILE__) + '/../test_helper'
require "test/unit"
require "selenium"

class IdeExportTest < Test::Unit::TestCase
  
  # This is what IDE exports
  def setup
		@sel = Selenium::SeleniumDriver.new("localhost", 4444, "*firefox", "http://localhost:3000", 15000)
    @verification_errors = []
    if $selenium
      @selenium = $selenium
    else
      @selenium = Selenium::SeleneseInterpreter.new("localhost", 4444, "*firefox", "http://localhost:3000", 10000);
      @selenium.start
    end
    @selenium.set_context("test_more", "info")
  end
  
  def teardown
    @selenium.stop unless $selenium
    assert_equal [], @verification_errors
  end
  
  def test_more
    @selenium.open "/roles"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "users-search-input"
    @selenium.type "users-search-input", "test"
    @selenium.click "commit"
  end
end
