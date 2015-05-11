Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: [:index, :show]
  resources :draft_posts, only: [:index, :destroy]
end
