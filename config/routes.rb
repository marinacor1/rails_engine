Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/merchants/find_all', to: "merchants#show"
      get '/merchants/find', to: "merchants#show"
      get '/merchants/random', to: "merchants#random"
      resources :merchants, except: [:new, :edit] do
      end

      get 'customers/find_all', to: "customers#show"
      get 'customers/find', to: "customers#find"
      get 'customers/random', to: "customers#random"
      resources :customers, except: [:new, :edit] do
      end

      get 'items/find_all', to: "items#show"
      get 'items/find', to: "items#find"
      get 'items/random', to: "items#random"
      resources :items, except: [:new, :edit] do
      end

      get 'invoices/find_all', to: "invoices#show"
      get 'invoices/find', to: "invoices#find"
      get 'invoices/random', to: "invoices#random"
      resources :invoices, except: [:new, :edit] do
      end

      get 'transactions/find_all', to: "transactions#show"
      get 'transactions/find', to: "transactions#find"
      get 'transactions/random', to: "transactions#random"
      resources :transactions, except: [:new, :edit] do
      end

      get 'invoice_items/find_all', to: "invoice_items#show"
      get 'invoice_items/find', to: "invoice_items#find"
      get 'invoice_items/random', to: "invoice_items#random"
      resources :invoice_items, except: [:new, :edit] do
      end
    end
  end
end
