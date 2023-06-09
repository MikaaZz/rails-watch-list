Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'pages#home'
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :destroy, :create]
  end
end
