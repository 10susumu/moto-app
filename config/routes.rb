Rails.application.routes.draw do
  resources :content do
    resources :comment, only: :create
  end

  get "user/index"
  devise_for :users
  root "content#index"
end