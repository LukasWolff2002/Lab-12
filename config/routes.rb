Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  get 'viewpost', to: 'pages#viewpost'
  get 'viewcomment', to: 'pages#viewcomment'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users
  resources :posts do
    resources :comments
  end
  resources :comments
end
