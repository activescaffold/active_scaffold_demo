require File.dirname(__FILE__) + '/../../test_helper'
require 'nature/bears_controller'

# Re-raise errors caught by the controller.
class Nature::BearsController; def rescue_action(e) raise e end; end

class Nature::BearsControllerTest < Test::Unit::TestCase
  def setup
    @controller = Nature::BearsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
