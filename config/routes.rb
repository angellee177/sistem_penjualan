Rails.application.routes.draw do
  resources :users, except: [:new]
  
  # Register Routes
  get '/signup', to: 'users#new'

end



