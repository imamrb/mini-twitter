Rails.application.routes.draw do
  root 'tweets#index'
  resource :users

  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :comments, only: [:create, :destroy]
end
