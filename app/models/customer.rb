class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.select("merchants.*, count(invoices.merchant_id) AS invoice_number")
    .joins(invoices: :transactions)
             .merge(Transaction.successful)
             .group("merchants.id")
             .order("invoice_number DESC")
             .first
  end
end
