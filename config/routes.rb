Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]  do
    resources :items do
      resources :locations
      collection do
        get 'search'
        post 'tweet'
      end
    end
  end
  resources :rakuten_items do
    collection do
      get   'search'
    end
  end

  root 'top#welcome'
  resources :top
  get '/help' => 'top#help'
  get '/developer' => 'top#developer'
  get '/contact' => 'top#contact'
end
