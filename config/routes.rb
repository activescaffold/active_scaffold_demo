ActionController::Routing::Routes.draw do |map|

  map.namespace :nature do |nature|
    nature.resources :tracking_devices, :active_scaffold => true
  end

  map.connect '', :controller => "demo"

  map.connect ':controller/service.wsdl', :action => 'wsdl'

  map.connect ':controller/:action/:id'
end
