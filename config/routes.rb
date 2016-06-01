Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/merchants/find_all', to: "merchants#show"
      get '/merchants/find', to: "merchants#show"
      get '/merchants/random', to: "merchants#random"
      resources :merchants, except: [:new, :edit] do
      end
      resources :customers, except: [:new, :edit] do
      end
    end
  end
end
