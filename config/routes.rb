Dbros::Application.routes.draw do
  	
  resources :name_societies

  resources :societies

  resources :investigations

  resources :galleries

  resources :fascicles

  resources :dossiers

  	resources :unions

  	resources :associations

  	resources :ambits

  	devise_for :admins
  	devise_for :users
  	devise_for :names
  	
  	
	resources :users
 	resources :areas
 	resources :names
 	

	
	match '/names_search' => 'names#names_search'
	match '/show_search_results' => 'names#show_search_results'
	
	#match '/names_search' => 'names#names_search', :action => 'names_search'
  	#match '/show_search_results' => 'names#show_search_results', :action => 'show_search_results'
	

	
#map.about "/about", :controller => "info", :action => "about"  
 #match "/about" => "info#about", :as => :about  
	
	
	
	

  get "home/index"
  root :to => "home#index" 

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
