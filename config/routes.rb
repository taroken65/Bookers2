Rails.application.routes.draw do
  root to: 'homes#top'
  get "about" => "homes#about"
  devise_for :users
  resources :books
  resources :users, only: [:show, :index, :edit, :update]
end
