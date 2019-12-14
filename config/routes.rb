# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  scope "(/:locale)", locale: /en|ja/ do
    resources :books
  end

  get "/:locale" => "books#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
