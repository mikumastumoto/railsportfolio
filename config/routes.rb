Rails.application.routes.draw do
  get "login"=>"users#login_form"
  post "login"=>"users#login"
  post"logout"=>"users#logout"
  post "users/create"=>"users#create"
  get "signup"=>"users#new"
  get 'users/index'=>"users#index"
  get 'users/:id'=>"users#show"
  get 'posts/index'=>"posts#index"
  get "posts/new"=>"posts#new"
  get "posts/:id"=>"posts#show"
  post "posts/create"=>"posts#create"
  
  get "/"=>"home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about"=>"home#about"
  post"posts/:id/destroy"=>"posts#destroy"
  
end
