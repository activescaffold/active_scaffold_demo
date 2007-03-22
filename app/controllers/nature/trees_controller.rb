class Nature::TreesController < ApplicationController
  
  active_scaffold :trees do |config|
    config.columns[:roots].association.reverse = :wood
  end
  
end

