Rails.application.routes.draw do

  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/edit'
  get 'searches/search'
  devise_for :users
  root "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"
  get "chats/:id" => "chats#show", as: "chat"
  get "category_search" => "homes#category_search"

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "follows", on: :member
    get "followers", on: :member
    get "book_search", on: :member
  end

  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resource :chats, only: [:create]
  resources :groups do
    get :join, on: :member
  end
end
