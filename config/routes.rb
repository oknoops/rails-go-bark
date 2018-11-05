Rails.application.routes.draw do
  # get 'contracts/create'
  # get 'reviews/create'
  # get 'pets/index'
  # get 'pets/show'
  # get 'pets/new'
  # get 'pets/create'
  # get 'pets/edit'
  # get 'pets/update'
  # get 'pets/destroy'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'

  root to: 'pets#index'
  devise_for :users
  resources :pets do
    resources :reviews, :contracts, only: [:create]
  end

  resources :users, except: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
