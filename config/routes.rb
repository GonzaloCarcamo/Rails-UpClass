Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations:'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'ads/new2'

  resources :tags
  resources :categories
  resources :ads

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'ads#index'
end
