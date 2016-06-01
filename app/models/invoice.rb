class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  def as_json(options)
    super({only: [:id, :customer_id, :merchant_id, :status]}.merge(options))
  end

end
