Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  resources :users, only: [:show, :index]
  root "books#index"
  resources :books

  # scope "(/:locale)", locale: /en|ja/ do
  #   resources :books
  # end

  # get "/:locale" => "books#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
