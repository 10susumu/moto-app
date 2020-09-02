Rails.application.routes.draw do
  resources :content
  get "user/index"
  devise_for :users
  root "content#index"
end