# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :food, except: [:update]
  resources :recipes, except: [:update]
  resources :generalshoppinglist
  get 'general_shopping_list', to: 'generalshoppinglist#index'
end
