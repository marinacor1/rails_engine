class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  belongs_to :merchant, through: :invoices

end
