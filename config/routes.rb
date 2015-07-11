Rails.application.routes.draw do

  get '/my_basket' => 'users#show'

  root to: 'visitors#index'
  
  devise_for :users, controllers: {registrations: "registrations"}

  post "baskets/:basket_id/send_sms" => "users#send_sms", as: :send_sms

  resources :addresses

  resources :baskets do
    resources :items do
    end
  end
end
