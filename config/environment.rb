# ENV['RAILS_ENV'] ||= 'production'
RAILS_GEM_VERSION = '1.2'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
end

ActiveScaffold.set_defaults do |config| 
  config.ignore_columns.add [:created_at, :updated_at, :id, :lock_version]
end
