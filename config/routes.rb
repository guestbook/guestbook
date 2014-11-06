Rails.application.routes.draw do
  get "/auth/github/callback", to: "sessions#create"
  get "/", to: "posts#index"

  resources :posts, only: [:index, :show, :create, :destroy]
  put "/posts/:id/approve", to: "posts#approve"

  resources :users, only: [:index, :show]
end
