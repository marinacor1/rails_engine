class Item < ActiveRecord::Base
  belongs_to :merchant

  def as_json(options)
    super({only: [:id, :name, :description, :unit_price]}.merge(options))
  end

end
