# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
  end

  get 'logout', to: 'sessions#destroy'

  resources :homes, only: %w[index create]
  resources :users, only: [:show]

  root to: 'homes#index'
end
