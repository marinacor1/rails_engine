Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/merchants/find_all', to: "merchants#find_all"
      get '/merchants/find', to: "merchants#find"
      get '/merchants/random', to: "merchants#random"
      get 'merchants/:id', to: "merchants#show"
      get '/merchants/:id/items', to: "merchant_items#index"
      get '/merchants/:id/invoices', to: "merchant_invoices#index"
      resources :merchants, only: [:index] do
      end

      get 'customers/find_all', to: "customers#find_all"
      get 'customers/find', to: "customers#find"
      get 'customers/random', to: "customers#random"
      get 'customers/:id', to: "customers#show"
      get 'customers/:id/invoices', to: "customers#invoices"
      get 'customers/:id/transactions', to: "customers#transactions"
      resources :customers, only: [:index] do
      end

      get 'items/find_all', to: "items#find_all"
      get 'items/find', to: "items#find"
      get 'items/random', to: "items#random"
      get 'items/:id', to: "items#show"
      get 'items/:id/invoice_items', to: "items#invoice_items"
      get 'items/:id/merchant', to: "items#merchant"
      resources :items, only: [:index] do
      end

      get 'invoices/find_all', to: "invoices#show"
      get 'invoices/find', to: "invoices#find"
      get 'invoices/random', to: "invoices#random"
      get 'invoices/:id/transactions', to: "invoices#transactions"
      get 'invoices/:id/invoice_items', to: "invoices#invoice_items"
      get 'invoices/:id/items', to: "invoices#items"
      get 'invoices/:id/customer', to: "invoices#customer"
      get 'invoices/:id/merchant', to: "invoices#merchant"
      resources :invoices, except: [:new, :edit] do
      end

      get 'transactions/find_all', to: "transactions#show"
      get 'transactions/find', to: "transactions#find"
      get 'transactions/random', to: "transactions#random"
      get 'transactions/:id/invoice', to: "transactions#invoice"
      resources :transactions, except: [:new, :edit] do
      end

      get 'invoice_items/:id/invoice', to: "invoice_items#invoice"
      get 'invoice_items/:id/item', to: "invoice_items#item"
      get 'invoice_items/find_all', to: "invoice_items#show"
      get 'invoice_items/find', to: "invoice_items#find"
      get 'invoice_items/random', to: "invoice_items#random"
      resources :invoice_items, except: [:new, :edit] do
      end
    end
  end
end
