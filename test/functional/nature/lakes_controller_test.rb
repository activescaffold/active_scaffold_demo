require File.dirname(__FILE__) + '/../../test_helper'
require 'nature/lakes_controller'

# Re-raise errors caught by the controller.
class Nature::LakesController; def rescue_action(e) raise e end; end

class Nature::LakesControllerTest < Test::Unit::TestCase
  def setup
    @controller = Nature::LakesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
