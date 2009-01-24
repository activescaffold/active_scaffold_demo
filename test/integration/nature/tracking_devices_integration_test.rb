require 'test_helper'

class Nature::TrackingDevicesIntegrationTest < ActionController::IntegrationTest
  

  context "nature::tracking_devices" do
    setup do
      @record = {:name => Factory.next(:name)}
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
    
    context "delete" do
      setup do
        TrackingDevice.all.each(&:delete)
        @to_delete = Factory(:tracking_device)
        click_link "nature__tracking_devices-destroy-1-link"
      end
      
      should "allow cancelling" do
        click_button "Cancel"
      end
      
      should "allow deleting" do
        click_button "Ok"
      end
    end
    
    context "show" do
      setup do
        TrackingDevice.all.each(&:delete)
        @record = Factory(:tracking_device)
        sleep 1
        click_link "nature__tracking_devices-show-1-link"
      end
      
      should "show data" do
        assert_contain(@record.name)
        assert_contain(@record.taggable)
      end
      
      should "allow close" do
        click_link "Close"
      end
      
      should "allow cancel" do
        click_link "Close"
      end
    end
    
    context "with lots of records" do
      setup do
        TrackingDevice.all.each(&:delete)
        @records = []
        (1..30).each do 
          @records << Factory(:tracking_device)
        end
      end
      
      context "doing search" do
        setup do
          click_link "Search"
        end
        
        should "allow close" do
          click_link "Close"
        end
        
        should "allow reset" do
          click_link "Reset"
        end
        
        should "allow searching" do
          fill_in 'nature__tracking_devices-search-input', :with => @records[10].name
          clicks_link "Search"
          assert_contain(@records[10].name)
          click_link "nature__tracking_devices-show-#{@records[10]}-link"
        end
      end
      
      context "paging" do
        should "allow walking the tree" do
          click_link "2"
          click_link "previous"
          click_link "next"
        end
        
        should "allow sorting" do 
          click_link "2"
          click_link "Name"
          click_link "Name"
          click_link "Name"
        end
      end
    end
  end
  
end
