require File.dirname(__FILE__) + '/../../test_helper'
require 'nature/roots_controller'

# Re-raise errors caught by the controller.
class Nature::RootsController; def rescue_action(e) raise e end; end

class Nature::RootsControllerTest < Test::Unit::TestCase
  def setup
    @controller = Nature::RootsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
