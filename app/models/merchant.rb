class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_customer
    customers.select("customers.*, count(invoices.customer_id) AS invoice_number")
    .joins(invoices: :transactions)
             .merge(Transaction.successful)
             .group("customers.id")
             .order("invoice_number DESC")
             .first
  end

  def pending_customers
    invoices.joins(:transactions)
            .merge(Transaction.pending)
            .map(&:customer).uniq
  end

  # def self.revenue(date = nil)
  #   if date.nil?
  #     invoices.merge(Transaction.successful)
  #                  .joins(:invoice_items)
  #                  .sum('quantity * unit_price')
  #   else
  #     invoices.merge(Transaction.successful)
  #                 .where(invoices: {created_at: date})
  #                .joins(:invoice_items)
  #                .sum('quantity * unit_price')
  #    end
  # end

  def self.most_items(quantity)
    limit(quantity)
            .joins(invoices: [:transactions, :invoice_items])
            .where(transactions: { result: 'success'})
            .group(:id)
            .order( 'sum(invoice_items.quantity) DESC')
  end

end
