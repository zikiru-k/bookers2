Rails.application.routes.draw do
  # devise を使用する際に URL として users を含むことを示す
  devise_for :users
  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'

  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit]
end
