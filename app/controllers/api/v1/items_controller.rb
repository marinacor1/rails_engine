require 'pry'
module Api
  module V1
    class ItemsController < Api::ApiController
      respond_to :json

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.where(item_params).first
      end

      def find
        respond_with Item.find_by(item_params)
      end

      def random
        random = rand(1..100)
        respond_with Item.find(random)
      end

      def invoice_items
        item = Item.find(params[:id])
        respond_with item.invoice_items
      end

      def merchant
        item = Item.find(params[:id])
        respond_with item.merchant
      end
      private

      def item_params
        params.permit(:name, :id, :created_at, :updated_at)
      end

    end
  end
end
