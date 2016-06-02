require 'pry'
module Api
  module V1
    class MerchantsController < Api::ApiController
      respond_to :json

      def index
        respond_with Merchant.all
      end

      def show
        respond_with Merchant.where(search_params).first
      end

      def find
        respond_with Merchant.find_by(search_params)
      end

      def find_all
        respond_with Merchant.where(search_params).first
      end

      def random
        random = rand(1..100)
        respond_with Merchant.find(random)
      end

      def most_revenue
        quantity = params[:quantity]
        Merchant.joins(:invoice)
        #Find all merchants and all invoices with status "shipped"
        #Find all transactions within an invoice with result: "success"
        #Find all invoice_items within an invoice, multiply the quantity and unit price
        #Add up all the costs within an invoice for a merchant
        #Add up all costs for all invoices for a merchant (revenue)
        #Sort merchants by revenue
      end

      private

      def search_params
        params.permit(:name, :id, :created_at, :updated_at)
      end

    end
  end
end
