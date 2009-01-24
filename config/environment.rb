# ENV['RAILS_ENV'] ||= 'production'
RAILS_GEM_VERSION = '2.2.2'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session = { :session_key => "_active_scaffold_demo", :secret => ("shhh." * 6) }
end

ActiveScaffold.set_defaults do |config| 
  config.ignore_columns.add [:created_at, :updated_at, :id]
end

load RAILS_ROOT + "/db/schema.rb" if RAILS_ENV == 'test'