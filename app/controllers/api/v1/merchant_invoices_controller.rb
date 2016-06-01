class Api::V1::MerchantInvoicesController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.find(params[:id])
    respond_with merchant.invoices
  end
end
