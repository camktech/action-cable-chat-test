Rails.application.routes.draw do
  resources :topics, only: [:index, :new, :show, :create]

  root 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
