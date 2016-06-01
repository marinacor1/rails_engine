class Customer < ActiveRecord::Base
  def as_json(options)
    super({only: [:id, :first_name, :last_name]}.merge(options))
  end
end
