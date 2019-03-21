# frozen_string_literal: true

Rails.application.routes.draw do
  resources :vehicles
  resources :users
  resources :vehicle_models
  resources :vehicle_manufacturers
end
