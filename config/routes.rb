Rails.application.routes.draw do

  get 'secrets' => 'secrets#index'

  get 'secrets/new'

  post 'secrets/create' => 'secrets#create'

  post 'secrets/destroy/:id' => 'secrets#destroy'

  post 'likes/create/:secretid/:userid' => 'likes#create'
  post 'likes/destroy/:secretid/:userid' => 'likes#destroy'

  get 'users/new' => 'users#new'
  get 'users/edit' => 'users#edit'
  post 'users/destroy' => 'users#destroy'
  post 'users/update' => 'users#update'
  get 'users/:id' => 'users#show'
  post 'users/create' => 'users#create'
  post 'users/logout' => 'users#logout'
  get 'sessions/new' =>'sessions#new'
  post 'sessions/new' => 'sessions#create'

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
