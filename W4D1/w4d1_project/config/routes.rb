Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:new, :edit] do
    resources :artworks, only: [:index]
  end

  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  #
  # # get '/users/new', to: 'users#new', as: 'new_user'
  #
  # get '/users/:id', to: 'users#show', as: 'edit_user'
  #
  # # get '/users/:id/edit', to: 'users#edit', as: 'user'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :artworks, except: [:new, :edit]
end
