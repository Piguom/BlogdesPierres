Rails.application.routes.draw do
  root 'articles#index'
    
  devise_for :users
    
  resources :articles
  resources :commentaires
  resources :users

  get '/:user/articles' => 'articles#user_articles', as: 'user_articles'
    get 'users' => 'users#form'
    post 'users' => 'users#create'


end
