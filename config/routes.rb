ActionController::Routing::Routes.draw do |map|
  map.resources :links
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ':id', :controller => 'links', :action => 'redirect'
end
