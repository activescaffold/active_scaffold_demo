require 'test_helper'

class Nature::TrackingDevicesIntegrationTest < ActionController::IntegrationTest
  
  @record = {:name => Factory.next(:name)}

  context "nature::tracking_devices" do
    setup do
      visit nature_tracking_devices_path
    end
    
    context "create" do
      setup do
        click_link "Create New"
      end
      
      should "allow user to cancel" do
        click_link "Cancel"
      end
      
      should "allow user to close by clicking X" do
        click_link "Close"
      end
      
      context "should allow clicking create with valid data" do
        setup do
          click_button "Create"
        end
        should_change('TrackingDevice.count', :by => 1)
      end
      
    end
  end
  
  # create cancel
  # create X
  # create empty
  # create create
  # sort name
  # sort taggable
  # edit
  #   invalid
  #   cancel
  #   X
  # delete
  # show
  # search
  # paginate
  
end
