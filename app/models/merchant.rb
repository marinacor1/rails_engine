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

  def revenue
    invoices.joins(:transactions)
             .joins(:invoice_items)
             .where(transactions: {result: "success"})
             .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def most_items(quantity)
    limit(quantity)
            .joins(invoice_items: [Transactions, :invoice_items])
            .where(transactions: { result: success})
            .group(:id)
            .order( 'sum(invoice_items.quantity) DESC')
  end

end
