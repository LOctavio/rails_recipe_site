# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "recipes#public_recipes"
  resources :foods, except: [:update]
  resources :recipes, except: [:update]
  resources :general_shopping_lists
  resources :ingredients
  post '/ingredients/:id', to: 'ingredients#update', as: "update_ingredient"
  delete '/ingredients/:id', to: 'ingredients#destroy', as: "delete_ingredient"
end
