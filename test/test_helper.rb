require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'shoulda'
require 'webrat'

Webrat.configure do |config|
  config.mode = ENV['WEBRAT_INTEGRATION_MODE'].to_sym
end

ActionController::Base.class_eval do
  def perform_action
    perform_action_without_rescue
  end
end
Dispatcher.class_eval do
  def self.failsafe_response(output, status, exception = nil)
    raise exception
  end
end
class Test::Unit::TestCase
  self.use_transactional_fixtures = false
  self.use_instantiated_fixtures  = false
  fixtures :all
end
require 'factory_girl'
require File.expand_path(File.dirname(__FILE__) + '/factories')

