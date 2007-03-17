require File.dirname(__FILE__) + '/../../test_helper'
require 'nature/trunks_controller'

# Re-raise errors caught by the controller.
class Nature::TrunksController; def rescue_action(e) raise e end; end

class Nature::TrunksControllerTest < Test::Unit::TestCase
  def setup
    @controller = Nature::TrunksController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
