require 'pry'
module Api
  module V1
    class MerchantsController < Api::ApiController
      respond_to :json

      def index
        respond_with Merchant.all.as_json({only: [:id, :name, :created_at, :updated_at]})
      end

      def show
       respond_with Merchant.find_by(search_params)
      end

      private

      def search_params
        params.permit(:name, :id, :created_at, :updated_at)
      end

    end
  end
end
