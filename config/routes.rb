HackerNews::Application.routes.draw do
  resources :links, :except => [:show]
  resources :votes, :only => [:create]

  root :to => 'links#index'
end
