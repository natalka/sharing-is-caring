Rails.application.routes.draw do
  devise_for :users

  get '/users/:id', to: 'users#show', as: 'user'
  resources :users do
    resources :media_items
  end

  root 'media_items#index'
end
