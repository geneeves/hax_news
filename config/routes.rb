HackerNews::Application.routes.draw do
  resources :links, :except => [:update, :destroy, :edit]
  resources :votes, :only => [:create]
  resources :comments, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create]
  resource :sessions, :only => [:new, :create, :destroy]


  root :to => 'links#index'
end
