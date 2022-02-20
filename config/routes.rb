# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount Sidekiq::Web => '/admin/sidekiq'

  root 'events#index'
  resources :events
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  resource :forgot_password, only: %i[new create]
  resource :password, only: %i[edit update]

  namespace :admin do
    resources :events do
      member do
        put 'approve'
        put 'decline'
      end
    end
  end
end
