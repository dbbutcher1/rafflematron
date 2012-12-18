Rafflematron::Application.routes.draw do

  
  match "winners/winner" => "winners#winner", :via => :get, :as => "winners_winner"

  match "raffle/name" => "raffle#name", :via => :get, :as => "raffle_name"
  match "raffle/type" => "raffle#type", :via => :post, :as => "raffle_type"
  match "raffle/prize" => "raffle#prize", :via => :post, :as => "raffle_prize"
  match "raffle/completed" => "raffle#completed", :via => :post, :as => "raffle_completed"
  match "entries/enter" => "entries#enter", :via => :get, :as => "entries_enter"
  match "entries/confirm" => "entries#confirm", :via => :post, :as => "entries_confirm"

  resources :winners
  resources :raffle do
  end

  resources :entries

  get "user/index"

  get "users_controller/users"

  devise_for :admins

  devise_for :users
  devise_for :Users
  resource :user

  get "users/index"

  get "users/show"

  get "users/_user"

  get "user/signup"

  get "user/login"

  get "home/index"

root :to=>"home#index"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
