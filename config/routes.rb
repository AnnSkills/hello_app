Rails.application.routes.draw do
  resources :users
  resources :links
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
end
