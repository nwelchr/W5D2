Rails.application.routes.draw do
  resource :session
  resources :posts do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :show]
  resources :users
  resources :subs

end
