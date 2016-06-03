class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoices, through: :invoice_items
  has_many :invoice_items

  def best_day
    invoice_items.successful
                 .group("invoices.created_at")
                 .order("sum_quantity DESC")
                 .sum("quantity")
                 .first[0]
  end

  def self.most_items(quantity)
    limit(quantity)
            .joins(:invoices)
            .group(:id)
            .order( 'sum(invoice_items.quantity) DESC')
  end

  # def self.ranked_by_total_revenue(num)
  #   joins(:invoice_items).group(:id)
  #   .order('sum(invoice_iems).unit_price * invoice_items.quantity) DESC')
  #   .limit(num)
  # end

end
