module Api
  module V1
    class CustomersController < Api::ApiController
      respond_to :json

      def index
        respond_with Customer.all
      end

      def show
        respond_with Customer.where(customer_params).first
      end

      def find
        respond_with Customer.find_by(customer_params)
      end

      def find_all
        respond_with Customer.where(customer_params)
      end

      def random
        random = rand(1..100)
        respond_with Customer.find(random)
      end

      def invoices
        customer = Customer.find(params[:id])
        respond_with customer.invoices
      end

      def transactions
        customer = Customer.find(params[:id])
        respond_with customer.transactions
      end

      def favorite_merchant
        customer = Customer.find(params[:id])
        all_invoices = customer.invoices
        merchant_group =all_invoices.group_by do |invoice|
          invoice.merchant.name
        end
        sorted = merchant_group.sort_by {|merchant| merchant.count}.first.first
        respond_with Merchant.find_by(name: sorted)
      end

      private

      def customer_params
        params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
      end
    end
  end
end
