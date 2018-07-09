Rails.application.routes.draw do
  get 'topics', to: 'topics#index'

  get 'topics/new'

  get 'topics/create'

  get 'topics/:id', to: 'topics#show'

  root 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
