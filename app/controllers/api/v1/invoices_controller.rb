require 'pry'
module Api
  module V1
    class InvoicesController < Api::ApiController
      respond_to :json

      def index
        respond_with Invoice.all
      end

      def show
        respond_with Invoice.where(search_params)
      end

      def find
        respond_with Invoice.find_by(search_params)
      end

      def random
        random = rand(1..100)
        respond_with Invoice.find(random)
      end

      def transactions
        invoice = Invoice.find(params[:id])
        respond_with invoice.transactions
      end

      private

      def search_params
        params.permit(:customer_id, :id, :merchant_id, :status, :created_at, :updated_at)
      end

    end
  end
end
