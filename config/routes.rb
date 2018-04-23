# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    delete 'logout', to: 'devise/sessions#destroy'
  end
  root to: 'homes#index'

  resources :homes, only: %w[index create]
  resources :users, only: [:show]
end
