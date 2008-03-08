# ENV['RAILS_ENV'] ||= 'production'
RAILS_GEM_VERSION = '2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session = {
    :session_key => '_ASDemo_session',
    :secret      => 'c2d0f3ae9f3f997dfe368a738d0b04cfff6f00bcca4b9d5a1d464eca19ddd564936c8990e36a9f7a437db4bf2ee64068019f4a5c978c4d82e1fe618d58c8becd'
  }
end

ActiveScaffold.set_defaults do |config| 
  config.ignore_columns.add [:created_at, :updated_at]
end
