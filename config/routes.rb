Fresk::Application.routes.draw do
  devise_for :users
  get '/start', to: 'users/base#index', as: :user_root

  resources :task_lists, module: 'users' do
    resources :tasks, only: [:new, :create]
  end

  get 'not_found', to: 'home#not_found'

  root to: 'home#index'

  get '*anything', to: 'home#not_found'

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
end
