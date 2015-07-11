Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  post "baskets/:basket_id/send_sms" => "users#send_sms", as: :send_sms
end
