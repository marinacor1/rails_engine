class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    id = Item.first.id
    get :merchant, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "Mr.Merchant", parsed_json["name"]

  end
end
