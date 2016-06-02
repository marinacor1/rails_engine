require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "it shows the invoice for an invoice item" do
    id = Item.first.id
    get :invoice_items, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 4, parsed_json.first["quantity"]
    assert_equal 11,  parsed_json.first["unit_price"]
    assert_equal 298486374,  parsed_json.first["id"]
  end

  test "it shows an items merchant" do
    id = Item.first.id
    get :merchant, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "Mr.Merchant", parsed_json["name"]
  end

end
