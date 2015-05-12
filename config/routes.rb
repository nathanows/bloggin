Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create]
  end

  resources :draft_posts, only: [:index, :destroy, :create]
end
