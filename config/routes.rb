Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get('/home', to: 'welcome#home')
  get('/about', to: 'welcome#about')
  get('/contact_us', to: 'welcome#contact_us')
  post('/thank_you', to: 'welcome#thank_you')

  #bill splitter
  get '/bill_splitter', to: 'bill_splitter#new'
  post '/calculate_split', to: 'bill_splitter#create'

  # Session Routes
  resource :session, only: [:new, :create, :destroy]

  # RESTful Product Routes
  #  get '/products/new', to: 'products#new', as: :new_product
  #  post '/products', to: 'products#create'
  #  get '/products/:id', to: 'products#show', as: :product
  #  get '/products', to: 'products#index'
  #  delete '/products/:id', to: 'products#destroy'
  #  get '/products/:id/edit', to: 'products#edit', as: :edit_product
  #  patch '/products/:id', to: 'products#update'

  resources :products do
    resources :reviews, only: [:create, :destroy]
  end

  resources :newsarticles

end
