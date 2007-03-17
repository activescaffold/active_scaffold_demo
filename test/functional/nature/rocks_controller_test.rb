require File.dirname(__FILE__) + '/../../test_helper'
require 'nature/rocks_controller'

# Re-raise errors caught by the controller.
class Nature::RocksController; def rescue_action(e) raise e end; end

class Nature::RocksControllerTest < Test::Unit::TestCase
  def setup
    @controller = Nature::RocksController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
