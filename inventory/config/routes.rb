Rails.application.routes.draw do
  devise_for :users

  get '/products/new' => 'products#new'
  get '/products/:id/edit' => 'products#edit'
  get '/products/:id/borrow' => 'petitions#borrow'
  get '/products/:id/return' => 'products#return'
  get '/products/:id/clear_image' => 'products#clear_image'

  get '/petitions/:id/accept' => 'petitions#accept'
  get '/petitions/:id/reject' => 'petitions#reject'
  get '/petitions/index' => 'petitions#index'

  get '/users/index' => 'users#index'
  get '/users/:id/edit' => 'users#edit'
  get '/users/new' => 'users#new'
  get '/users/config' => 'users#configuration'
  post '/users/create' => 'users#create'
  post '/users/:id/update' => 'users#update'
  post '/users/update_self' => 'users#update_self'


  post '/products/:id/new_petition' => 'petitions#new_petition'
  post '/products/create' => 'products#create'
  post '/products/:id/update' => 'products#update'
  delete '/products/:id' => 'products#delete'

  post 'lang' => 'home#set_language'

  root 'home#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
