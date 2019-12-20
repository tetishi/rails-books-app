# frozen_string_literal: true

Rails.application.routes.draw do
  root "books#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end

  resources :users, only: [:show, :index]
  resources :books
  resources :friendships, only: [:create, :destroy]
end
