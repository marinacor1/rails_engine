module Api
  module V1
    class CustomersController < Api::ApiController
      respond_to :json

      def index
        respond_with Customer.all
      end

      def show
        respond_with Customer.where(customer_params)
      end

      def find
        respond_with Customer.find_by(customer_params)
      end

      def random
        random = rand(1..100)
        respond_with Customer.find(random)
      end

      private

      def customer_params
        params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
      end
    end
  end
end
