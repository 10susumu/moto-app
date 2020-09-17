Rails.application.routes.draw do
  root "content#index"
  resources :content do
    resources :comment, only: :create
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :user do
    resources :chat, only: :create
  end
end