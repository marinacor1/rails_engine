require 'pry'
module Api
  module V1
    class InvoicesController < Api::ApiController
      respond_to :json

      def index
        respond_with Invoice.all
      end

      def show
        respond_with Invoice.find(params[:id])
      end

      def find
        respond_with Invoice.where(search_params).first
      end

      def find_all
        respond_with Invoice.where(search_params)
      end

      def random
        random = rand(1..100)
        respond_with Invoice.find(random)
      end

      def transactions
        invoice = Invoice.find(params[:id])
        respond_with invoice.transactions
      end

      def invoice_items
        invoice = Invoice.find(params[:id])
        respond_with invoice.invoice_items
      end

      def items
        invoice = Invoice.find(params[:id])
        respond_with invoice.items
      end

      def customer
        invoice = Invoice.find(params[:id])
        respond_with invoice.customer
      end

      def merchant
        invoice = Invoice.find(params[:id])
        respond_with invoice.merchant
      end

      private

      def search_params
        params.permit(:customer_id, :id, :merchant_id, :status, :created_at, :updated_at)
      end

    end
  end
end
