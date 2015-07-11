Rails.application.routes.draw do
  get 'items/index'

  get 'items/edit'

  get 'items/show'

  get 'items/new'

  root to: 'visitors#index'
  
  devise_for :users

  post "baskets/:basket_id/send_sms" => "users#send_sms", as: :send_sms

  resrouces :addresses
  
  resources :baskets do
    resources :items do
    end
  end
end
