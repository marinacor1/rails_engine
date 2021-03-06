require 'pry'
module Api
  module V1
    class InvoiceItemsController < Api::ApiController
      respond_to :json

      def index
        respond_with InvoiceItem.all
      end

      def show
        respond_with InvoiceItem.find(params[:id])
      end

      def find
        respond_with InvoiceItem.find_by(search_params)
      end

      def find_all
        respond_with InvoiceItem.where(search_params)
      end

      def random
        respond_with Transaction.order("RANDOM()").first
      end

      def invoice
        invoice_item = InvoiceItem.find(params[:id])
        respond_with invoice_item.invoice
      end

      def item
        invoice_item = InvoiceItem.find(params[:id])
        respond_with invoice_item.item
      end

      private

      def search_params
        params.permit(:name, :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
      end

    end
  end
end
