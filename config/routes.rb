Mockup::Application.routes.draw do
  get "wizard"  => "wizard#index"
  get "results" => "search#index"
  get "search" => "search#search"
  get "log_in" => "sessions#new"
  post "log_in" => "sessions#create"
  get "log_out" => "sessions#destroy"

  get "register" => "users#new"
  post "register" => "users#create"

  get "list_articles" => "articles#list"
  resources :users, :articles

  root 'start#index'
end
