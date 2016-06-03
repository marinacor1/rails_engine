class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

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
    # invoices.joins()
    #          .where(invoices: { created_at: date})
    #          .joins(:invoice_items)
    #          .sum('quantity * unit_price')
                # .joins(transactions: :invoices)
                # .merge(Transaction.successful).map(&:quantity)
    # invoice_items.joins(transactions: :invoices)
  # all_invoices = invoices.joins(:transactions)
                        #  .merge(Transaction.successful)
                        #  .joins(:invoice_items)
    # all_invoices.inject(0) do |sum, num|
    #   sum +=
    # end
  end

  def most_items(quantity)
    limit(quantity)
            .joins(invoice_items: [Transactions, :invoice_items])
            .where(transactions: { result: success})
            .group(:id)
            .order( 'sum(invoice_items.quantity) DESC')
  end

end
