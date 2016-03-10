Rails.application.routes.draw do

  devise_for :users
  get '/' => 'site#home'

  resources :users do
    resources :products do
      resources :reviews

    end
  end

  resources :users do
      resources :bids
  end

  resources :products do
      resources :bids
  end



end
