require 'pry'
module Api
  module V1
    class MerchantsController < Api::ApiController
      respond_to :json

      def index
        respond_with Merchant.all
      end

      def show
        respond_with Merchant.find(params[:id])
      end

      def find
        respond_with Merchant.find_by(search_params)
      end

      def find_all
        respond_with Merchant.where(search_params)
      end

      def random
        respond_with Merchant.order("RANDOM()").first
      end

      def favorite_customer
        merchant = Merchant.find(params[:id])
        respond_with merchant.favorite_customer
      end

      def most_revenue
        respond_with Merchant.most_revenue(params[:quantity])
      end

      def most_items
        respond_with Merchant.most_items(params[:quantity])
      end

      def revenue
        respond_with Merchant.revenue(params[:date])
      end

      def single_revenue
        respond_with Merchant.all.first
      end

      def pending_invoices
        merchant = Merchant.find(params[:id])
        respond_with merchant.pending_customers
      end

      private

      def search_params
        params.permit(:name, :id, :created_at, :updated_at)
      end

    end
  end
end
