class Merchant < ActiveRecord::Base
  def as_json(options)
    super({only: [:id, :name]}.merge(options))
  end
end
