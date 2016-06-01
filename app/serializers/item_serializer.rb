class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price
  attribute :convert_to_dollars, key: :dollar

  def convert_to_dollars
    (object.unit_price.to_d)/100
  end
end
