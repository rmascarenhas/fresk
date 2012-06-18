Fresk::Application.routes.draw do
  devise_for :users
  get '/start', to: 'users/base#index', as: :user_root

  resources :task_lists, module: 'users' do
    resources :tasks, only: [:new, :create]
  end

  resources :watched_task_lists, module: 'users', only: [:index, :create, :destroy]

  get 'not_found', to: 'home#not_found'

  root to: 'home#index'

  get '*anything', to: 'home#not_found'

end
