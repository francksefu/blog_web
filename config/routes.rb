Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "users#index"
   get 'posts/new', to: 'posts#new', as: 'new_posts'
   post 'posts', to: 'posts#create'

   get 'comments/new', to: 'comments#new', as: 'new_comments'
   post 'comments', to: 'comments#create'

  
   post 'likes', to: 'likes#create'

   resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
   end
end
