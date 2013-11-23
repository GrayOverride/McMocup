Mockup::Application.routes.draw do
  get "static/privacy"
  get "static/about"
  get "static/about_app"
  get "static/terms"
  get "wizard"  => "wizard#index"
  get "results" => "search#index"
  get "search" => "search#search"
  get "search_page" => "search#index"
  get "log_in" => "sessions#new"
  post "log_in" => "sessions#create"
  get "log_out" => "sessions#destroy"

  get "register" => "users#new"
  post "register" => "users#create"

  get "list_articles" => "articles#list"
  resources :users, :articles

  root 'start#index'
end
