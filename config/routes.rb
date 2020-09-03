Rails.application.routes.draw do
  resources :content do
    resources :comment, only: :create
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :user

  root "content#index"
end