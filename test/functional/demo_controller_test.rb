require File.dirname(__FILE__) + '/../test_helper'
require 'demo_controller'

# Re-raise errors caught by the controller.
class DemoController; def rescue_action(e) raise e end; end

class DemoControllerTest < Test::Unit::TestCase
  def setup
    @controller = DemoController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
