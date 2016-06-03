class Transaction < ActiveRecord::Base
  belongs_to :invoice
  scope :successful, -> {where(result: "success")}
  scope :pending, -> {where.not(result: "success")}

end
