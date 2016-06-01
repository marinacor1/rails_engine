class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def as_json(options)
    super({only: [:id, :date, :result, :invoice_id,]}.merge(options))
  end

end
