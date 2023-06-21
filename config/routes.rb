Rails.application.routes.draw do
  get 'user/email'
  get 'user/password'
  get 'user/pofilepic'
  get 'user/first_name'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tents do
    resources :bookings, only: %i[show new create]
  end
  resources :bookings, only: %i[edit update destroy]
end
