Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: [:index, :show, :new, :create, :destroy]
  resources :draft_posts, only: [:index, :destroy, :create]
end
