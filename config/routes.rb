Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      # get '/merchants/most_revenue', to: "merchants#most_revenue"
      get '/merchants/most_items', to: "merchants#most_items"
      get '/merchants/find_all', to: "merchants#find_all"
      get '/merchants/find', to: "merchants#find"
      get '/merchants/random', to: "merchants#random"
      get '/merchants/:id/items', to: "merchant_items#index"
      get '/merchants/:id/favorite_customer', to: "merchants#favorite_customer"
      get '/merchants/:id/favorite_customer', to: "merchants#favorite_customer"
      get '/merchants/:id/customers_with_pending_invoices', to: "merchants#pending_invoices"
      get '/merchants/:id/invoices', to: "merchant_invoices#index"
      # get 'merchants/revenue/', to: 'merchants#most_revenue'
      get '/merchants/:id/revenue', to: "merchants#revenue"
      get 'merchants/:id', to: "merchants#show"
      resources :merchants, only: [:index] do
      end

      get 'customers/find_all', to: "customers#find_all"
      get 'customers/find', to: "customers#find"
      get 'customers/random', to: "customers#random"
      get 'customers/:id/invoices', to: "customers#invoices"
      get 'customers/:id/transactions', to: "customers#transactions"
      get 'customers/:id/favorite_merchant', to: "customers#favorite_merchant"
      get 'customers/:id', to: "customers#show"
      resources :customers, only: [:index] do
      end

      get 'items/find', to: "items#find"
      get 'items/find_all', to: "items#find_all"
      get 'items/random', to: "items#random"
      get 'items/:id/invoice_items', to: "items#invoice_items"
      get 'items/:id/merchant', to: "items#merchant"
      get 'items/:id/best_day', to: "items#best_day"
      get 'items/most_items', to: "items#most_items"
      get 'items/:id', to: "items#show"
      resources :items, only: [:index] do
      end

      get 'invoices/find_all', to: "invoices#find_all"
      get 'invoices/find', to: "invoices#find"
      get 'invoices/random', to: "invoices#random"
      get 'invoices/:id/transactions', to: "invoices#transactions"
      get 'invoices/:id/invoice_items', to: "invoices#invoice_items"
      get 'invoices/:id/items', to: "invoices#items"
      get 'invoices/:id/customer', to: "invoices#customer"
      get 'invoices/:id/merchant', to: "invoices#merchant"
      resources :invoices, except: [:new, :edit] do
      end

      get 'transactions/find_all', to: "transactions#find_all"
      get 'transactions/find', to: "transactions#find"
      get 'transactions/random', to: "transactions#random"
      get 'transactions/:id/invoice', to: "transactions#invoice"
      resources :transactions, except: [:new, :edit] do
      end

      get 'invoice_items/:id/invoice', to: "invoice_items#invoice"
      get 'invoice_items/:id/item', to: "invoice_items#item"
      get 'invoice_items/find_all', to: "invoice_items#find_all"
      get 'invoice_items/find', to: "invoice_items#find"
      get 'invoice_items/random', to: "invoice_items#random"
      resources :invoice_items, except: [:new, :edit] do
      end
    end
  end
end
