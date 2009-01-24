class Nature::TrackingDevicesController < ApplicationController
  active_scaffold :tracking_devices do |config|
    config.list.per_page = 10
  end
end
