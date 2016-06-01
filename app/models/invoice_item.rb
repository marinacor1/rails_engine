class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def as_json(options)
    super({only: [:id, :item_id, :invoice_id, :quantity, :unit_price]}.merge(options))
  end

end
