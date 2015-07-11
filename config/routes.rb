Rails.application.routes.draw do
  get 'items/index'

  get 'items/edit'

  get 'items/show'

  get 'items/new'

  root to: 'visitors#index'
  
  devise_for :users

  resources :baskets do
    resources :items do
    end
  end

end
