Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :baskets do
    resources :items do
    end
  end

end
