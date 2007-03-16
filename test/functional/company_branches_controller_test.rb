require File.dirname(__FILE__) + '/../test_helper'
require 'company_branches_controller'

# Re-raise errors caught by the controller.
class CompanyBranchesController; def rescue_action(e) raise e end; end

class CompanyBranchesControllerTest < Test::Unit::TestCase
  def setup
    @controller = CompanyBranchesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
