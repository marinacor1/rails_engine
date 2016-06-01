class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def as_json(options)
    super({only: [:id, :credit_card_number, :credit_card_expiration_date, :result, :invoice_id,]}.merge(options))
  end

end
