# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "recipes#public_recipes"
  resources :foods, except: [:update]
  resources :recipes, except: [:update]
  resources :general_shopping_lists
  resources :ingredients
end
