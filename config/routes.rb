Rails.application.routes.draw do
  get 'static_pages/splash'
  # get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  root to: 'static_pages#splash'
  devise_for :users
  # resources :users, only: [:index, :show, :new] do
  #   resources :categories, only: [:new, :create, :show, :index, :destroy]
  #   resources :purchases, only: [:new, :create, :index, :show, :destroy]
  # end
end

