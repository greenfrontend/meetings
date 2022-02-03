# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'
  resources :events
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  namespace :admin do
    resources :events do
      member do
        put 'approve'
        put 'decline'
      end
    end
  end
end
