Rails.application.routes.draw do
  # devise を使用する際に URL として users を含むことを示す
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
end
