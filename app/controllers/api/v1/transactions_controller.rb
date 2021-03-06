require 'pry'
module Api
  module V1
    class TransactionsController < Api::ApiController
      respond_to :json

      def index
        respond_with Transaction.all
      end

      def show
        respond_with Transaction.where(search_params).first
      end

      def find_all
        respond_with Transaction.where(search_params)
      end

      def find
        respond_with Transaction.find_by(search_params)
      end

      def random
        respond_with Transaction.order("RANDOM()").first
      end

      def invoice
        transaction = Transaction.find(params[:id])
        respond_with transaction.invoice
      end

      private

      def search_params
        params.permit(:invoice_id, :id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
      end

    end
  end
end
