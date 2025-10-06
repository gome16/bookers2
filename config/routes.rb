Rails.application.routes.draw do
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :edit, :update, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
