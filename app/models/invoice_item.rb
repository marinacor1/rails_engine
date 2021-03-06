class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  scope :successful, -> { joins(:invoice).merge(Invoice.successful)}
end
