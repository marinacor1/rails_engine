class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def best_day
    invoice_items.joins(:transactions).successful
                .order(quantity: :desc).take(2)
                .first.invoice.created_at
  end

  def self.most_items(quantity)
    limit(quantity)
            .joins(:invoices)
            .group(:id)
            .order( 'sum(invoice_items.quantity) DESC')
  end


end
