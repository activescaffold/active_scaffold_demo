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
    
    context "sorting" do 
      should "allow triple sort on name" do
        click_link "Name"
        click_link "Name"
        click_link "Name"
      end
      should "allow triple sort on taggable" do
        click_link "Taggable"
        click_link "Taggable"
        click_link "Taggable"
      end
    end
    
    context "edit" do 
      setup do
        TrackingDevice.all.each(&:delete)
        @editable = Factory(:tracking_device)
        click_link "nature__tracking_devices-edit-#{@editable.id}-link"
      end
      
      should "allow cancel" do
        click_link "Cancel"
      end
      
      should "allow close" do
        click_link "Close"
      end
      
      should "allow editing" do
        fill_in("Name", :with => "different_name")
        click_button "Update"
        sleep 0.1
        @editable.reload
        assert_equal("different_name", @editable.name)
      end
      
    end
  end
  
  
  # delete
  # show
  # search
  # paginate
  
end
