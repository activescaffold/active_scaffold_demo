require 'test_helper'

class BaseNavigationIntegrationTest < ActionController::IntegrationTest

  context "not_logged_in" do
    setup do
      visit '/'
    end
    should 'work fine' do
    end
  end

end
