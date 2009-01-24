require 'test_helper'

class BaseNavigationIntegrationTest < ActionController::IntegrationTest

  context "not_logged_in" do
    setup do
      visit '/'
    end
    should 'work fine' do
    end
  
    context "scenarios" do
      ["habtm", "has_many", "belongs_to", "has_one", "join model", "polymorphic", "security", "field/form overrides"].each do |scenario|
        should "be able to jump to scenario #{scenario}" do
          select scenario
        end
      end
    end
    
    context "controllers" do
      ["account", "addresses", "alias", "demo", "bears", "lakes", "parks", 
       "tracking_devices", "permissions", "roles", "secured_records", "users"].each do |scenario|
        should "be able to jump to controller #{scenario}" do
          select scenario
        end
      end
    end
  end

end
