NaganoConforInn::Application.routes.draw do


  namespace :administration do
    # routes en lien avec l'administration
    resources :reservation_rooms, :reservations
    resources :room_pricings, :rooms, only: [:index, :show, :edit, :update, :new, :create]
    resources :settings, only: [:show, :edit, :update, :new, :create]
    resources :room_types, only: [:index, :create]
    resource :room_views, :room_pictures, only: [:create]

  end

  resources :customers, only: [:create, :edit, :update]

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   RoomPricings :products

  # Sample resource route with options:
  #   RoomPricings :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-RoomPricings:
  #   RoomPricings :products do
  #     RoomPricings :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-RoomPricings
  #   RoomPricings :products do
  #     RoomPricings :comments
  #     RoomPricings :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     RoomPricings :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'pages#index'

  get 'index' => 'pages#index'
  get 'search' => 'pages#search', :as => 'search_page'
  get 'shopping_cart' => 'shopping_carts#show', :as => 'shopping_cart'
  post 'shopping_cart' => 'shopping_carts#add', :as => 'shopping_cart'
  delete 'shopping_cart' => 'shopping_carts#delete', :as => 'shopping_cart'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'sign_up' => 'pages#sign_up', :as => "sign_up"
  get 'myreservations' => 'customers#reservations'
  get 'administration', to: 'administration/administration#index'
  get 'administration/overview', to: 'administration/administration#overview'
  get 'administration/check_in', to: 'administration/administration#check_in'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
