require File.dirname(__FILE__) + '/../test_helper'
require 'company_addresses_controller'

# Re-raise errors caught by the controller.
class CompanyAddressesController; def rescue_action(e) raise e end; end

class CompanyAddressesControllerTest < Test::Unit::TestCase
  def setup
    @controller = CompanyAddressesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
