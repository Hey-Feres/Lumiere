Rails.application.routes.draw do
    devise_for :users

    resources :titles

    root 'home#index'
end
