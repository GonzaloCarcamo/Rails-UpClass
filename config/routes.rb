Rails.application.routes.draw do

  resources :comments

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations:'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :tags
  resources :categories
  resources :ads

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ads#index'
end
