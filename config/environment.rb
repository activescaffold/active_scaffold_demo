# ENV['RAILS_ENV'] ||= 'production'
RAILS_GEM_VERSION = '2.1'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session = { :session_key => "_active_scaffold_demo", :secret => ("shhh." * 6) }
<<<<<<< HEAD:config/environment.rb
<<<<<<< HEAD:config/environment.rb
#  config.gem 'brynary-webrat', :lib => false, :source => 'http://gems.github.com'
=======
>>>>>>> 49aada3... working on getting edge up to date:config/environment.rb
=======
  config.gem 'brynary-webrat', :lib => false, :source => 'http://gems.github.com'
>>>>>>> 1b66bde... removing requirement for now:config/environment.rb
end

ActiveScaffold.set_defaults do |config| 
  config.ignore_columns.add [:created_at, :updated_at, :id]
end

load RAILS_ROOT + "/db/schema.rb" if RAILS_ENV == 'test'