require 'pry'
module Api
  module V1
    class ItemsController < Api::ApiController
      respond_to :json

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.where(item_params)
      end

      def find
        respond_with Item.find_by(item_params)
      end

      def random
        random = rand(1..100)
        respond_with Item.find(random)
      end

      private

      def item_params
        params.permit(:name, :id, :created_at, :updated_at)
      end

    end
  end
end
