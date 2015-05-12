Rails.application.routes.draw do
  root 'posts#index'

  resources :posts

  resources :draft_posts, only: [:index, :destroy, :create]
end
