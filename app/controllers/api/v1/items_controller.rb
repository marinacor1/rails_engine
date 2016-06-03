require 'pry'
module Api
  module V1
    class ItemsController < Api::ApiController
      respond_to :json

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find(params[:id])
      end

      def find
          respond_with Item.find_by(item_params)
      end

      def find_all
        if params['id']
          respond_with Item.where(id: params[:id])
        else
          respond_with Item.where(item_params)
        end
      end

      def random
        respond_with Merchant.order("RANDOM()").first
      end

      def invoice_items
        item = Item.find(params[:id])
        respond_with item.invoice_items
      end

      def merchant
        item = Item.find(params[:id])
        respond_with item.merchant
      end

      def best_day
        item = Item.find(params[:id])
        respond_with best_day: item.best_day
      end

      def most_revenue
        respond_with Item.all
      end

      def most_items
        respond_with Item.most_items(params[:quantity])
      end

      private

      def item_params
        params.permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
      end

    end
  end
end
