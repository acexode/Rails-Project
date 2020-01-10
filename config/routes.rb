Rails.application.routes.draw do
  # get 'projects/show'
  # post 'projects/create' => 'projects#create'
  # get 'projects/new'
  # get 'projects/update'
  # get 'projects/delete'
  resources :projects
  get 'sessions/new'
  get '/login' => 'sessions#new'
  get '/dashboard' => 'sessions#dashboard'
  post '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'

  get '/signup' => 'users#signup'
  post '/users' => 'users#create'  
  get 'users/update'
  get 'users/destroy'

  root "projects#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
