require File.dirname(__FILE__) + '/../test_helper'
require 'companies_controller'

# Re-raise errors caught by the controller.
class CompaniesController; def rescue_action(e) raise e end; end

class CompaniesControllerTest < Test::Unit::TestCase
  def setup
    @controller = CompaniesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
