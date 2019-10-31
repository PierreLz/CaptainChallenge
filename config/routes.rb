# frozen_string_literal: true
Rails.application.routes.draw do
  root 'warriors#index'
  resources :warriors
  resources :pages
  resources :fights

  delete '/warriors/' => 'warriors#destroy'
  post '/warriors/' => 'warriors#create'

end
