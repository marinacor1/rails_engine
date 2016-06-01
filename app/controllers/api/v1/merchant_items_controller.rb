class Api::V1::MerchantItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end
end
