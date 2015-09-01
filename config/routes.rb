Rails.application.routes.draw do
  devise_for :users
  get '/users/:id', to: 'users#show', as: 'user'

  root 'media_items#index'
end
