
Rails.application.routes.draw do

  devise_for :users
   namespace :api, defaults: { format: :json }  do
      # Our Routes
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
      resources :purchases, :only => [:show, :create, :update, :destroy]
      resources :blocks, :only => [:show]
    end
end
