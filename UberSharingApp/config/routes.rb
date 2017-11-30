Rails.application.routes.draw do
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/profile/:id', to: 'posts#profile', as: 'view_profile'
  get '/posts/:id/potentialrider', to: 'posts#new_rider', as: 'rider_request'
  get '/myposts', to: 'posts#user_posts'


  root :to => redirect('/posts')
  resources :posts
  get '*path' => redirect('/posts')
end
