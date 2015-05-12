Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: [:index, :show, :new, :create]
  resources :draft_posts, only: [:index, :destroy]
end
