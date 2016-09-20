Rails.application.routes.draw do
  root 'articles#index'
    
  devise_for :users
    
  resources :articles
  resources :commentaires

  get '/:user/articles' => 'articles#user_articles', as: 'user_articles'
end
