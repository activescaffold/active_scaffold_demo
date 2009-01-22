ActionController::Routing::Routes.draw do |map|

  map.connect '', :controller => "demo"

  map.connect ':controller/service.wsdl', :action => 'wsdl'

  map.connect ':controller/:action/:id'
end
