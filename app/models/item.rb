class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoices, through: :invoice_items
  has_many :invoice_items

  def best_day
    invoices.select("invoices.created_at, count(invoices.created_at) AS date_count")
            .joins(invoice_items: :item)
            .group("invoices.created_at")
            .order("date_count DESC")
            .first
  end

end
