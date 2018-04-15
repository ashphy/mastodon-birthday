# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'homes#index'

  resources :homes, only: %i[index create]
  resources :users, only: [:show]
end
