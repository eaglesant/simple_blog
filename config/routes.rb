Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get '/contacts', to: 'contacts#new'
  get '/articles', to: 'articles#new'
  get '/about', to: 'about#show'
  get '/terms', to: 'terms#show'
  get '/works', to: 'pages#works'
  get '/links', to: 'pages#links'

  resources :articles do
    resource :comments, only: [:create]
  end
  resource :contacts, only: [:new, :create], path_names: { :new => ''}
  resource :about, only: [:show], path_names: { :show => ''}
  resource :terms, only: [:show], path_names: { :show => ''}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
