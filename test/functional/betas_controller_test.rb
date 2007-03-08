require File.dirname(__FILE__) + '/../test_helper'
require 'betas_controller'

# Re-raise errors caught by the controller.
class BetasController; def rescue_action(e) raise e end; end

class BetasControllerTest < Test::Unit::TestCase
  def setup
    @controller = BetasController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
