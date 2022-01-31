# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'
  resources :events
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  namespace :admin do
    # resources :events
    resource :session, only: %i[new create destroy]
  end
end
