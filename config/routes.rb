ActionController::Routing::Routes.draw do |map|

  #Root goes to welcome
  map.root :controller => 'welcome'

  #Map together short URLs for most controllers.
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.account 'account', :controller => 'users', :action => 'edit'
  map.cart 'cart', :controller => 'cart'
  map.blog 'blog.:format', :controller => 'posts'
  map.ethos 'ethos', :controller => 'taglines'
  map.settings 'settings', :controller => 'site', :action => 'index'
  
  #Map resourcse
  map.resources :site, :only => [:index, :edit, :update]
  map.resources :taglines, :only => [:index, :edit, :update]
  map.resources :sessions, :only => [:create, :destroy]
  map.resources :products
  map.resources :categories, :has_many => :products
  map.resources :users, :has_many => :orders
  map.resources :posts
  map.resources :orders
  map.resources :pages

 
  #Map default routes
  map.connect ':name', :controller => 'pages', :action => 'show'
  map.connect ':name/edit', :controller => 'pages', :action => 'edit'
  map.connect ':name/update', :controller => 'pages', :action => 'update'
  map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
end
